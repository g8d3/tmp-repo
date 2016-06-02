class Tweet < ActiveRecord::Base

  def self.ten_latest
    Rails.cache.read(:ten_latest_tweets)
  end

  def self.ten_latest!(save = true)
    Rails.cache.write :ten_latest_tweets, ten_latest_hash
    # WIP save to DB
    # save_ten_latest(ten_latest) if save
    ten_latest
  end

  def self.save_ten_latest(ten_latest_hash)
    ten_latest_hash.each do |topic, oembeds|
      oembeds.each do |oembed|
        create html: oembed.html, topic: topic
      end
    end
  end

  def self.ten_latest_from_db
    order('created_at desc').where(topic: topics[0]).limit(10)
    .union( order('created_at desc').where(topic: topics[1]).limit(10) )
    .union( order('created_at desc').where(topic: topics[2]).limit(10) )
  end

  def self.ten_latest_from_db!
    Rails.cache.write :ten_latest_tweets, ten_latest_from_db
    ten_latest_from_db
  end

  # Output:
  # {
  #   'healthcare'  => [oembed1, ...],
  #   'nasa'        => [oembed2, ...],
  #   'open source' => [oembed3, ...],
  # }
  def self.ten_latest_hash
    Hash[ten_latest_array]
  end

  # Output:
  # [
  #   ['healthcare', [oembed1, ...]],
  #   ['nasa', [oembed2, ...]],
  #   ['open source', [oembed3, ...]],
  # ]
  def self.ten_latest_array
    topics.map do |topic|
      ids = ten_latest_ids topic

      oembeds = twitter.oembeds ids, omit_script: true

      [topic, oembeds]
    end
  end

  # Output: [1,2,3,4]
  def self.ten_latest_ids(query)
    twitter.search(query, result_type: "recent").take(10).map &:id
  end

  def self.topics
    ['healthcare', 'nasa', 'open source']
  end

  # Debug method
  def self.api_limits
    twitter.get 'https://api.twitter.com/1.1/application' +
      '/rate_limit_status.json?resources=help,users,search,statuses,oembed'
  end

  # Debug method
  def self.search_api_limits
    api_limits[:resources][:search]
  end
end

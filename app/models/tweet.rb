class Tweet < ActiveRecord::Base

  def self.ten_latest
    # cache is set by ActiveJob with ten_latest!
    # fetch is used to set cache the first time even when user could wait
    Rails.cache.read(:ten_latest_tweets)
  end

  def self.ten_latest!
    Rails.cache.write :ten_latest_tweets, ten_latest_hash
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
end

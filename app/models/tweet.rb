class Tweet < ActiveRecord::Base

  def self.ten_latest
    # cache is set by ActiveJob with ten_latest!
    # fetch is used to set cache the first time even when user could wait
    Rails.cache.fetch(:ten_latest_tweets) do
      CacheTweetsJob.perform_async
      ten_latest!
    end
  end

  # Output:
  # [
  #   ['u1: healthcare1','u2: healthcare2', ...]
  #   ['u3: nasa1','u4: nasa2', ...]
  #   ['u5: os1','u6: os2', ...]
  # ]
  def self.ten_latest!
    topics.map do |topic|
      twitter.search(topic, result_type: "recent").take(10).map do |tweet|
        "#{tweet.user.screen_name}: #{tweet.text}"
      end
    end
  end

  def self.topics
    ['healthcare', 'nasa', 'open source']
  end
end

class CacheTweetsJob # < ActiveJob::Base
  # queue_as :default

  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence do
    secondly(75)
  end

  def perform
    Rails.cache.write :ten_latest_tweets, Tweet.ten_latest!
  end
end

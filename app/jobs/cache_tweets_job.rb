class CacheTweetsJob # < ActiveJob::Base
  # queue_as :default

  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence do
    # API limit for search is 180 per 15 minutes, one each 5 seconds.
    # secondly(20)

    # Each oembed request spends 30 requests, one each 5 seconds
    # gives 150 seconds per batch
    minutely 3
  end


  def perform
    Tweet.ten_latest!
  end
end

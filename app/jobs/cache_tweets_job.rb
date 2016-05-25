class CacheTweetsJob # < ActiveJob::Base
  # queue_as :default

  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence do
    # API limit for search is 180 per 15 minutes, one each 5 seconds.
    secondly(20)
  end


  def perform
    Tweet.ten_latest!
  end
end

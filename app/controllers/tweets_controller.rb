class TweetsController < InheritedResources::Base
  respond_to :json

  def ten_latest
    render json: Tweet.ten_latest
  end

  def tweet
    render json: twitter.update(params[:message])
  end

  private

    # redirect to collection_url instead
    def resource_url; nil end

    def tweet_params
      params.require(:tweet).permit(:html)
    end
end

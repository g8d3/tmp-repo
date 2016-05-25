json.array!(@tweets) do |tweet|
  json.extract! tweet, :id, :html
  json.url tweet_url(tweet, format: :json)
end

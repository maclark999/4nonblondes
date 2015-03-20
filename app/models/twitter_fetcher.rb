class TwitterFetcher

  attr_reader :client

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.consumer_key
      config.consumer_secret     = Rails.application.secrets.consumer_secret
      config.access_token        = Rails.application.secrets.access_token
      config.access_token_secret = Rails.application.secrets.access_token_secret
    end
  end

  def trends(id, options={})
    options[:id] = id
    response = get("/1.1/trends/place.json", options)
    collection_from_array(Twitter::Trend, response[:body].first[:trends])[0..8]
  end

  def human(woeid)
    Rails.cache.fetch("twittertrends/#{woeid}", expires_in:5.minutes) do
    @client.trends(woeid).map do |trend|
      {tag: trend[:name], search_term: trend[:name].underscore.humanize.gsub("#", "") }
    end
    end
  end



end

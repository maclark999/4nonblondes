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

  def top
    @client.search("to:barackobama thanks", :result_type => "recent").take(3).collect do |tweet|
      "#{tweet.text}"
    end
  end

end

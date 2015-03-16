class RedditFetcher
def initialize
  @conn = Faraday.new(:url => 'http://www.reddit.com') do |faraday|
    faraday.request  :url_encoded             # form-encode POST params
    faraday.response :logger                  # log requests to STDOUT
    faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
  end

  def reddit_news(searchterm)
    @searchterm = searchterm

    response = @conn.get do |req|
      req.url "/r/news/search.json?q=#{@searchterm}&restrict_sr=on&sort=relevance&t=week"
      req.headers['content-type'] = 'application/json'
    end
    @returnedsearch= JSON.parse(response.body)
  end

  def titles_urls(searchterm)
    @new = RedditFetcher.new
    @new.reddit_news(searchterm)['data']['children'].map do |child|
      {title: child['data']['title'], url: child['data']['url']}
    end
  end

end
end


 #reddit_news['data']['children'].map{|child| child['data']['title']

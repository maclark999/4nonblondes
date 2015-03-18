class NprFetcher

  def initialize
    @conn = Faraday.new(:url => 'http://api.npr.org') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP  end
    end

  def npr_news(searchterm)
    response = @conn.get do |req|
      req.url "/query?searchTerm=#{searchterm}&output=MediaRSS&searchType=fullContent&output=JSON&apiKey=MDE4NTUyNTU0MDE0MjY2MTEzOTBmMjlkMw001&sort=relevance"
      req.headers['content-type'] = 'application/json'
    end
    @returnedsearch= JSON.parse(response.body)
  end

  def titles_urls(searchterm)
    @new = NprFetcher.new
    @search = @new.npr_news(searchterm)
    unless @search.nil?
      unless @search['list']['story'].nil?
      @search['list']['story'].map do |child|

      # if child['thumbnail'].present?
      # img_val = child['thumbnail']['large']['$text']
      # end
      # if child['title'].present?
      #   title = child['title']['$text']
      # end

      {title: child['title']['$text'], url: child['link'][-1]['$text']}
    end
  end
  end
  end


  def title_url(searchterm)
    @new = NprFetcher.new
    @search = @new.npr_news(searchterm)
    unless @search.nil?
      unless @search['list']['story'].nil?
          {title: @search['list']['story'][0]['title']['$text'], url: @search['list']['story'][0]['link'][-1]['$text']}
        end
      end
    end




end
end

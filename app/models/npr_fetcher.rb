class NprFetcher

  def initialize
    @conn = Faraday.new(:url => 'http://api.npr.org') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP  end
    end

  def npr_news(searchterm)
    @searchterm = searchterm

    response = @conn.get do |req|
      req.url "/query?searchTerm=#{@searchterm}&output=MediaRSS&searchType=fullContent&output=JSON&apiKey=MDE4NTUyNTU0MDE0MjY2MTEzOTBmMjlkMw001&sort=relevance"
      req.headers['content-type'] = 'application/json'
    end
    @returnedsearch= JSON.parse(response.body)
  end

  # def img
  #   unless child['thumbnail']['large']['$text'].nil?
  #       child['thumbnail']['large']['$text']
  #   end
  # end

  def titles_urls(searchterm)
    @new = NprFetcher.new
    @new.npr_news(searchterm)['list']['story'].map do |child|

      img_val = if child['thumbnail'].present? 
        child['thumbnail']['large']['$text']
      end

      {title: child['title']['$text'], url: child['link'][2]['$text'], img: img_val }
    end
  end


end
end

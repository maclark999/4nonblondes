class BingFetcher
  attr_reader :bing_image
  def initialize
    @bing_image = Bing.new(ENV['PRIMARY_ACCOUNT_KEY'], 1, 'Image')
  end

  def image_search(image)
    unless @bing_image.search(image).nil?
      unless @bing_image.search(image)[0].nil?
        unless @bing_image.search(image)[0][:Image][0].nil?
    @bing_image.search(image)[0][:Image][0][:Thumbnail][:MediaUrl]
        end

      end
    end
  end
end

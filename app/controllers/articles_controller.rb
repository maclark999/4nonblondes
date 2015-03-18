class ArticlesController < ApplicationController

  def index
    @nprfetcher = NprFetcher.new
    @tfetcher = TwitterFetcher.new
  end

  def show
  end

end

class ArticlesController < ApplicationController
  def index
    @fetcher = NprFetcher.new
  end

  def show
  end
end

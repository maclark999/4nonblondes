class ArticlesController < ApplicationController

  before_filter :authenticate

  def index
    @nprfetcher = NprFetcher.new
    @tfetcher = TwitterFetcher.new
  if params[:param].nil?
    @woeid = 23424977
  else
    @woeid = params[:param]
  end
    @faketweets = [{:tag=>"#WhatDoesHappinessMean", :search_term=>"what does happiness mean"},
      {:tag=>"#DitchYourDateIn5Words", :search_term=>"ditch your date in5 words"},
      {:tag=>"#NBABands", :search_term=>"nba bands"},
      {:tag=>"#WonderfulNewsInFourWords", :search_term=>"wonderful news in four words"},
      {:tag=>"#AgDay2015", :search_term=>"ag day2015"},
      {:tag=>"Moynihan", :search_term=>"Moynihan"},
      {:tag=>"1 Gotta Go", :search_term=>"1 gotta go"},
      {:tag=>"Tunisia", :search_term=>"Tunisia"},
      {:tag=>"Jim Boeheim", :search_term=>"Jim boeheim"},
      {:tag=>"Bradley Fletcher", :search_term=>"Bradley fletcher"}]
  end

  def show
    @nprfetcher = NprFetcher.new
  end

end

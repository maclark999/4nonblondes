class ArticlesController < ApplicationController

  def index
    @nprfetcher = NprFetcher.new
    @tfetcher = TwitterFetcher.new
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
  end

end

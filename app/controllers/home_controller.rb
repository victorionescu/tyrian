class HomeController < ApplicationController
  def index
    @tweets = Twitter.user_timeline count: 5
  end
end

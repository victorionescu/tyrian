class HomeController < ApplicationController
  def index
    @tweets = Twitter.user_timeline count: 5

    @events = CalendarEvent.order("date ASC").limit(3).where("date >= :start_date", {start_date: Date.today})

    @about = Section.where("section_name='about'").first.section_content.split("\n").first
  end
end

class CalendarController < ApplicationController
  def index
    @events = CalendarEvent.order("date ASC").where("date >= :start_date", {start_date: Date.today})
  end
end

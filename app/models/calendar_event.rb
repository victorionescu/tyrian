class CalendarEvent < ActiveRecord::Base
  attr_accessible :date, :description, :title
  validates_presence_of :date
  validates_presence_of :description
  validates_presence_of :title
end

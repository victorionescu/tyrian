class GuestBookEntry < ActiveRecord::Base
  attr_accessible :content, :email, :name, :website
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :content
end

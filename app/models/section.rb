class Section < ActiveRecord::Base
  attr_accessible :section_content, :section_name
  validates_presence_of :section_name
end

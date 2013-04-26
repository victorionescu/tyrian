class AboutController < ApplicationController
  def index
    about_section = Section.where('section_name="about"').first
    
    @about_content = about_section.section_content
    @about_content = @about_content.gsub(/\n/, "<br\/>")
  end
end

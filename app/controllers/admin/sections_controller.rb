class Admin::SectionsController < ApplicationController
  before_filter :authenticate_member!, :require_admin!
  
  def require_admin!
    unless member_signed_in? && current_member.membership == "admin"
      flash[:error] = "You must be an admin to access this section"
      redirect_to root_path
    end
  end
  
  def index
    @sections = Section.all
  end
  
  def edit
    @section = Section.find(params[:id])
  end
  
  def update
    @section = Section.find(params[:id])
    @section.update_attributes(params[:section])
    
    if @section.save
      flash[:notice] = 'Section successfully updated.'
    else
      flash[:error] = 'Could not update section. Please try again.'
    end
    
    redirect_to manage_sections_path
  end
end

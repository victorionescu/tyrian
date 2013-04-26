class Admin::MembersController < ApplicationController
  before_filter :authenticate_member!, :require_admin!
  
  def require_admin!
    unless member_signed_in? && current_member.membership == "admin"
      flash[:error] = "You must be an admin to access this section"
      redirect_to root_path
    end
  end
  
  def index
    @members = Member.all
  end
  
  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    
    #@member.avatar = params[:member][:avatar]
    #@member.phone_number = params[:member][:phone_number]
    @member.update_attributes(params[:member])
    
    if @member.save
      flash[:notice] = "Member update successfully."
    else
      flash[:error] = @member.errors.first
    end
    
    redirect_to manage_members_path
  end
end

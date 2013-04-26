class Admin::CallTreeController < ApplicationController
  before_filter :authenticate_member!, :require_admin!
  
  def require_admin!
    unless member_signed_in? && current_member.membership == "admin"
      flash[:error] = "You must be an admin to access this section"
      redirect_to root_path
    end
  end
  
  def index
    @members = Member.where('membership="member"').order('name ASC')
  end
end

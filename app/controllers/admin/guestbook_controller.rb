class Admin::GuestbookController < ApplicationController
  before_filter :authenticate_member!, :require_admin!
  
  def require_admin!
    unless member_signed_in? && current_member.membership == "admin"
      flash[:error] = "You must be an admin to access this section"
      redirect_to root_path
    end
  end
  
  def index
    @pending_guest_book_entries = GuestBookEntry.where('accepted=false')
    
    @live_guest_book_entries = GuestBookEntry.where('accepted=true')
  end
  
  def accept
    @guest_book_entry = GuestBookEntry.find(params[:id])
    @guest_book_entry.accepted = true
    
    if @guest_book_entry.save
      flash[:notice] = "Entry Accepted"
    else
      flash[:error] = "Could not update entry. Please try again"
    end
    
    redirect_to manage_guestbook_path
  end
  
  def reject
    @guest_book_entry = GuestBookEntry.find(params[:id])
    
    if @guest_book_entry.destroy
      flash[:notice] = "Entry Removed"
    else
      flash[:error] = "Could not update entry. Please try again"
    end
    
    redirect_to manage_guestbook_path
  end
end

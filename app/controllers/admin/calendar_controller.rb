class Admin::CalendarController < ApplicationController
  before_filter :authenticate_member!, :require_admin!
  
  def require_admin!
    unless member_signed_in? && current_member.membership == 'admin'
      flash[:error] = 'You must be an admin to access this section.'
      redirect_to root_path
    end
  end
  
  def index
    @calendar_events = CalendarEvent.order('date DESC')
  end
  
  def new
    @calendar_event = CalendarEvent.new
  end
  
  def edit
    @calendar_event = CalendarEvent.find(params[:id])
  end
  
  def create
    @calendar_event = CalendarEvent.new(params[:calendar_event])
    
    if @calendar_event.save
      flash[:notice] = 'Event successfully added.'
    else
      flash[:error] = 'There was an error adding the event.'
    end
    
    redirect_to manage_calendar_path
  end
  
  def destroy
    @calendar_event = CalendarEvent.find(params[:id])
    
    if @calendar_event.destroy
      flash[:notice] = 'Event successfully removed'
    else
      flash[:error] = 'ERROR: Could not remove event.'
    end
    
    redirect_to manage_calendar_path
  end
end

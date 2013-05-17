class GuestBookEntriesController < ApplicationController
  def index
    @guest_book_entries = GuestBookEntry.order("created_at DESC").all
  end
  
  def create
    @guest_book_entry = GuestBookEntry.new(params[:guest_book_entry])
    if (verify_recaptcha)
      if (@guest_book_entry.save)
        redirect_to guest_book_entries_path, flash: {notice: "Your post will be visible once it has been reviewed."}
      else
        redirect_to new_guest_book_entry_path, flash: {error: "There was a problem posting your entry."}
      end
    else
      redirect_to new_guest_book_entry_path, flash: {error: "Could not verify captcha"}
    end
  end

  def new
    @guest_book_entry = GuestBookEntry.new
  end
end

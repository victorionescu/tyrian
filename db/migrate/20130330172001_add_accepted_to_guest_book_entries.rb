class AddAcceptedToGuestBookEntries < ActiveRecord::Migration
  def change
    add_column :guest_book_entries, :accepted, :boolean, null: false, default: false
  end
end

class CreateGuestBookEntries < ActiveRecord::Migration
  def change
    create_table :guest_book_entries do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :website
      t.text :content, null: false

      t.timestamps
    end
  end
end

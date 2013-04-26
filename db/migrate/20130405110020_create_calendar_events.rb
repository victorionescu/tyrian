class CreateCalendarEvents < ActiveRecord::Migration
  def change
    create_table :calendar_events do |t|
      t.date :date, null: false
      t.text :title, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end

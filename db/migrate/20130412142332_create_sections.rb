class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :section_name, null: false
      t.text :section_content

      t.timestamps
    end
  end
end

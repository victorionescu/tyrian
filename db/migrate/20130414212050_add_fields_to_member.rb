class AddFieldsToMember < ActiveRecord::Migration
  def change
    add_column :members, :name, :string, null: false
    add_column :members, :date_of_birth, :date, null: false
    add_column :members, :date_raised, :date, null: false
    add_column :members, :address, :string, null: false
    add_column :members, :employer, :string
    add_column :members, :title, :string
    add_column :members, :employment_time, :string
    add_column :members, :spouse_name, :string
    add_column :members, :first_child_name, :string
    add_column :members, :second_child_name, :string
    add_column :members, :third_child_name, :string
    add_column :members, :fourth_child_name, :string
  end
end

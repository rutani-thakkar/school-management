class AddFieldsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_reference :users, :school, foreign_key: true
  end
end

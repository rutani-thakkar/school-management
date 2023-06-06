class CreateSchools < ActiveRecord::Migration[7.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phone
      t.string :website
      t.text :description

      t.timestamps
    end
  end
end

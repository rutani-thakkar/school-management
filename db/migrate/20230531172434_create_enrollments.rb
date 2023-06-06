class CreateEnrollments < ActiveRecord::Migration[7.0]
  def change
    create_table :enrollments do |t|
      t.references :student, foreign_key: { to_table: :users, class_name: 'User' }
      t.references :batch, null: false, foreign_key: true
      t.integer :status
      t.text :message

      t.timestamps
    end
  end
end


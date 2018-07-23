class AddUserToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :owner_id, :bigint
    add_foreign_key :courses, :users, column: :owner_id
    add_index :courses, :owner_id
  end
end

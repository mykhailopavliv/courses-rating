class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :text
      t.integer :author_id
      t.integer :course_id

      t.timestamps
    end
  end
end

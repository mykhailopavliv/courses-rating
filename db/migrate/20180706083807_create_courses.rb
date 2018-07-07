class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.string :url
      t.integer :city_id
      t.integer :rating

      t.timestamps
    end
  end
end

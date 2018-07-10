class AddSlugToCourses < ActiveRecord::Migration[5.2]
  def change
    change_table :courses do |t|
      t.string :slug, after: :id
    end
  end
end

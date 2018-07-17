class RemoveRatingFromCourses < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :rating
  end
end

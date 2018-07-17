class AddPublishedToCoursesAndReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :published, :boolean
    add_column :reviews, :published, :boolean    
  end
end

class AddPublishedToCoursesAndReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :published, :boolean, default: false
    add_column :reviews, :published, :boolean, default: false
  end
end

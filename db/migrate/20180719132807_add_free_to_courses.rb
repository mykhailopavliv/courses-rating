class AddFreeToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :free, :boolean
  end
end

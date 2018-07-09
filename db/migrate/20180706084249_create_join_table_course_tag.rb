class CreateJoinTableCourseTag < ActiveRecord::Migration[5.2]
  def change
    create_join_table :courses, :tags do |t|
      t.index %i[course_id tag_id]
      t.index %i[tag_id course_id]
    end
  end
end

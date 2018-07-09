namespace :db do
  desc 'Loads the seed data for course tags'
  task seed_add_basic_tags: :environment do
    course = Course.find_by_title('#pivorak Ruby Summer Course 2018')
    course.tag_list.add('ruby', 'rails')
    course.save
  end
end

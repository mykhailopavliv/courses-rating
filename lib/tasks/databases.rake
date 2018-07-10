namespace :db do
  desc 'Loads the seed data for course tags'
  task seed_add_basic_tags: :environment do
    course = Course.find_by_title('#pivorak Ruby Summer Course 2018')
    course.tag_list.add('ruby', 'rails')
    course.save
  end

  desc 'Loads the seed data for course organization'
  task seed_add_basic_organization: :environment do
    organization = Organization.create(name: 'Pivorak',
                                       site: 'https://pivorak.com',
                                       description: 'Львівське об’єднання розробників')
    course = Course.find_by_title('#pivorak Ruby Summer Course 2018')
    course.organization = organization
    course.save
  end
end

namespace :db do
  desc 'Loads the seed data for course attach logo'
  task seed_add_pivorak_logo: :environment do
    course = Course.find_by_title('#pivorak Ruby Summer Course 2018')
    pivorak_logo_full_path = Rails.root.join('app/assets/images/pivorak logo/pivorak_logo.png')
    course.logo.attach(io: File.open(pivorak_logo_full_path),
                       filename: 'pivorak_logo.png')
  end
end

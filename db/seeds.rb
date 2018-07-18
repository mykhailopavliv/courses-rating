# This file should contain all the record creation needed to seed the database
# with its default values. The data can then be loaded with the rails db:seed
# command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

city_lviv = City.create(name: 'Lviv')
organization = Organization.create(name: 'Pivorak',
                                   site: 'https://pivorak.com',
                                   description: 'Львівське об’єднання розробників')

title_pivorak = '#pivorak Ruby Summer Course 2018'
desc_pivorak = "We at #pivorak believe that knowledge should be shared.\n
This summer we are gathering a group of experienced Ruby developers to teach a
 2-month intensive Ruby & Ruby on Rails course to a class\n
of (almost) complete beginners."
url_pivorak = 'https://pivorak.com/courses/seasons/ruby-2018'
course_pivorak = Course.create(title:        title_pivorak,
                               description:  desc_pivorak,
                               url:          url_pivorak,
                               organization: organization,
                               city:         city_lviv,
                               tag_list:     %w[ruby rails])

user = User.create(first_name: 'Pavlo',
                   last_name: 'Kasianchuk',
                   role: 'user',
                   email: 'pavlokasianchuk@gmail.com',
                   password: 'pavlopass')

Review.create!(text: 'The best Rugby course', author: user, course: course_pivorak)

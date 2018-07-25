require "administrate/base_dashboard"

class CityDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    courses: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :name,
    :courses
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :courses,
    :id,
    :name,
    :created_at,
    :updated_at
  ].freeze

  FORM_ATTRIBUTES = [
    :courses,
    :name
  ].freeze

   def display_resource(city)
     city.name
   end
end

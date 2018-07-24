require "administrate/base_dashboard"

class CourseDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    owner: Field::BelongsTo.with_options(class_name: "User"),
    organization: Field::BelongsTo,
    city: Field::BelongsTo,
    reviews: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    description: Field::Text,
    url: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    slug: Field::String,
    published: Field::Boolean,
    owner_id: Field::Number,
    free: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :owner,
    :organization,
    :city,
    :reviews,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :owner,
    :organization,
    :city,
    :reviews,
    :id,
    :title,
    :description,
    :url,
    :created_at,
    :updated_at,
    :slug,
    :published,
    :owner_id,
    :free,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :owner,
    :organization,
    :city,
    :reviews,
    :title,
    :description,
    :url,
    :slug,
    :published,
    :owner_id,
    :free,
  ].freeze

  # Overwrite this method to customize how courses are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(course)
  #   "Course ##{course.id}"
  # end
end

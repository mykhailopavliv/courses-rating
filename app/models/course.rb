class Course < ApplicationRecord
  extend FriendlyId
  belongs_to :city
  has_many :reviews

  friendly_id :title
  acts_as_taggable_on :tags
end

class Course < ApplicationRecord
  extend FriendlyId
  ratyrate_rateable 'rating'

  belongs_to :organization
  belongs_to :city
  has_many :reviews

  friendly_id :title, use: :slugged
  acts_as_taggable_on :tags

  scope :published, -> { where(published: true) }

  scope :unpublished, -> { where(published: false) }
end

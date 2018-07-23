class Course < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  acts_as_taggable_on :tags
  ratyrate_rateable 'rating'

  belongs_to :user, foreign_key: 'owner_id'
  belongs_to :organization, optional: true
  belongs_to :city
  has_many :reviews
  has_one_attached :logo

  scope :free_courses, -> { where(free: true) }
end

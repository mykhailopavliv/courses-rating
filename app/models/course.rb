class Course < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  ratyrate_rateable 'rating'
  acts_as_taggable_on :tags

  belongs_to :organization, optional: true
  belongs_to :city
  has_many :reviews

  has_one_attached :logo

  scope :published,    -> { where(published: true) }
  scope :unpublished,  -> { where(published: false) }
  scope :free_courses, -> { where(free: true) }
end

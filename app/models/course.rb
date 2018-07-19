class Course < ApplicationRecord
  extend FriendlyId
  ratyrate_rateable 'rating'

  belongs_to :organization
  belongs_to :city
  has_many :reviews
  # Associates an attachment and a blob. When the Course is destroyed they are
  # purged by default (models destroyed, and resource files deleted).
  has_one_attached :logo

  friendly_id :title, use: :slugged
  acts_as_taggable_on :tags

  scope :published,    -> { where(published: true) }
  scope :unpublished,  -> { where(published: false) }
  scope :free_courses, -> { where(free: true) }
end

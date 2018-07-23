class Course < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: %i[slugged finders history]

  ratyrate_rateable 'rating'
  acts_as_taggable_on :tags
  ratyrate_rateable 'rating'

  belongs_to :user, foreign_key: 'owner_id'
  belongs_to :organization, optional: true
  belongs_to :city
  has_many :reviews
  has_one_attached :logo

  scope :published, -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }
  scope :free_courses, -> { where(free: true) }

  def should_generate_new_friendly_id?
    title_changed?
  end
end

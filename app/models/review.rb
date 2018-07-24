class Review < ApplicationRecord
  belongs_to :course
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :text, presence: true

  scope :published,    -> { where(published: true) }
  scope :unpublished,  -> { where(published: false) }
end

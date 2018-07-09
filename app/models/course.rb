class Course < ApplicationRecord
  belongs_to :city
  has_many :reviews

  acts_as_taggable_on :tags
end

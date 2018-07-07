class Course < ApplicationRecord
  belongs_to :city
  has_many :reviews
  has_and_belongs_to_many :tags
end

class Course < ApplicationRecord
  has_one :city
  has_many :reviews
  has_and_belongs_to_many :tags
end

class Review < ApplicationRecord
  belongs_to :course
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
end
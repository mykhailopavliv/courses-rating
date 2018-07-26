class User < ApplicationRecord
  ratyrate_rater

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  has_many :courses, class_name: 'Course', foreign_key: 'owner_id'
  has_many :reviews, foreign_key: 'author_id'
  has_many :identities, dependent: :destroy

  def role?(role_name)
    role == role_name
  end
end

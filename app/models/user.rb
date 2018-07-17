class User < ApplicationRecord
  ratyrate_rater
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  has_many :reviews
  has_many :identities, dependent: :destroy
end

class User < ApplicationRecord
  has_many :bookings
  has_many :reviews
  has_many :comments
  has_many :likes, as: :likable

  devise :database_authenticatable, :registerable, :validatable,
    :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  ratyrate_rater

  class << self
    def from_omniauth auth
      User.find_or_create_by email: auth.info.email do |user|
        user.email = auth.info.email
        user.name = auth.info.name
        user.password = Devise.friendly_token[0, 10]
      end
    end

    def new_with_session params, session
      super.tap do |user|
        if data = session["devise.auth_data"] &&
          session["devise.auth_data"]["extra"]["raw_info"]
          user.email = data["email"]
        end
      end
    end
  end
end

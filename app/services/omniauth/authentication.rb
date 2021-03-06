module Omniauth
  class Authentication
    delegate :authenticated?, to: :policy
    delegate :uid, :provider, :first_name, :last_name, :avatar, :email, :url, to: :receive

    def initialize(params)
      @params = params
    end

    def authenticate
      return user if authenticated?
    end

    private

    attr_reader :params

    def receive
      @receive ||= ::Omniauth::Receive.new(params)
    end

    def user
      @user ||= ::User.find_or_create_by(email: email) do |user|
        user.first_name, user.last_name = fullname_params
        user.avatar   = avatar
        user.url      = url
        user.email    = email
        user.password = Devise.friendly_token[0, 20]
      end
    end

    def identity
      @identity ||= ::Identity.find_or_create_by(
        uid:      uid,
        provider: provider,
        user:     user
      )
    end

    def policy
      @policy ||= AuthenticationPolicy.new(
        user:     user,
        identity: identity
      )
    end

    def fullname_params
      [first_name, last_name]
    end
  end
end

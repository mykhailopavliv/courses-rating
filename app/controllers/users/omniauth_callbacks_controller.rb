# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController

    def facebook
      user = handler.authenticate
      if user
        flash[:notice] = t('.loginned')
        sign_in_and_redirect(user)
      else
        flash[:alert] = t('.alert')
        redirect_to(new_user_session_path)
      end
    end

    private

    def handler
      @handler ||= ::Omniauth::Authentication.new(omniauth_params)
    end

    def omniauth_params
      request.env['omniauth.auth']
    end
  end
end

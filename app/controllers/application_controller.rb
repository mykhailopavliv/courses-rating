class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  before_action :locale

  def locale
    I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end

  rescue_from Pundit::NotAuthorizedError, with: :not_new

  private

  def not_new
    flash[:alert] = 'Not allowed to create new. You should be owner'
    redirect_to(request.referrer || root_path)
  end
end

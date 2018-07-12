class ApplicationController < ActionController::Base
  before_action :locale

  def locale
    I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end
end

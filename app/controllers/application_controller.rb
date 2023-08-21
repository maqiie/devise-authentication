
class ApplicationController < ActionController::Base

  wrap_parameters format: []
        include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :exception
  # before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, alert: exception.message
  end
end

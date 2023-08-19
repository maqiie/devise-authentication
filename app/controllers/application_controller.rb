# class ApplicationController < ActionController::Base
#   skip_before_action :verify_authenticity_token
#   # skip_before_action :verify_authenticity_token, only: [:create]


#     # protect_from_forgery with: :exception
#     before_action :authenticate_user!
#     load_and_authorize_resource
#   end
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, alert: exception.message
  end
end

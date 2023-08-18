class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

    protect_from_forgery with: :exception
    before_action :authenticate_user!
    load_and_authorize_resource
  end
  
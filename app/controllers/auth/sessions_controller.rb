# frozen_string_literal: true

# class Users::SessionsController < Devise::SessionsController

class Users::SessionsController < DeviseTokenAuth::SessionsController
  wrap_parameters format: []

  #  skip_before_action :verify_authenticity_token
  # protect_from_forgery with: :null_session
  # skip_before_action :verify_authenticity_token

  respond_to :json
  # before_action :configure_sign_in_params, only: [:create]
  
  # GET /resource/sign_in
  # def new
  #   super
  # end
  @token = @resource.create_token

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
  # body: JSON.stringify({user:{
  #   email:"example@gmail.com",
  #   password:"example_password",
  #   password_confirmation:"<PASSWORD>"
  #   }})
  

  
  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  private

def sign_in_params
  params.require(:sessions).permit(:email, :password)
end


# def respond_with(resource, _opts = {})
#   render json: {
#     status: { code: 200, message: 'Logged in successfully.' },
#     data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
#   }, status: :ok
# end
def respond_with(resource, _opts = {})
  render json: {
    status: { code: 200, message: 'Logged in successfully.' },
    data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
  }, status: :ok
end


def respond_to_on_destroy
  if current_user
    render json: {
      status: 200,
      message: "Logged out successfully"
    }, status: :ok
  else
    render json: {
      status: 401,
      message: "Couldn't find an active session."
    }, status: :unauthorized
  end
end
end


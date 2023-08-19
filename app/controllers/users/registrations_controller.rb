# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  
  # skip_before_action :verify_authenticity_token
  # protect_from_forgery with: :null_session
  # skip_before_action :verify_authenticity_token, only: [:create]

  respond_to :json
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end
  protected

  def after_sign_up_path_for(resource)
    # Redirect to the root URL after successful registration
    posts_path
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end
  # body: JSON.stringify({user:{
  #   email:"example@gmail.com",
  #   password:"example_password"
  #   }})
  

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def render_resource(resource)
    if resource.persisted?
      render json: {
        status: { code: 200, message: 'Signed up successfully.' },
        data: {
          id: resource.id,
          email: resource.email
          # Include other attributes you want to expose
        }
      }
    else
      render json: {
        status: { code: 422, message: 'Sign up failed.' },
        errors: resource.errors.full_messages
      }, status: :unprocessable_entity
    end
  end
end

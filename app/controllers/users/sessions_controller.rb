# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    if User.find_by_email(params[:user][:email]).present?
    if User.find_by_email(params[:user][:email]).try(:confirmed_at).present?
    super
    else
      redirect_to :sign_in, notice:  'Please confirm your email first'
    end
    else
      redirect_to :sign_up, notice:  'User not found'
    end
  end
    # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters
  private

  def user_params
    params.require(:user).permit(:name, :avatar, :avatar_cache)
  end
  protected

  # my custom fields are :name, :heard_how
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation, :avatar, :avatar_cache)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name,
        :email, :password, :password_confirmation, :current_password, :avatar, :avatar_cache)
    end
  end
end

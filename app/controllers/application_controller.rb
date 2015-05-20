class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  include Pundit
  protect_from_forgery with: :exception
  before_action :flash_attack, if: :devise_controller?
  before_filter :configure_permitted_parameters, if: :devise_controller?


     rescue_from Pundit::NotAuthorizedError do |exception|
       redirect_to root_url, alert: exception.message
     end
     def after_sign_in_path_for(resource)
       topics_path
     end
   protected

   def flash_attack
     devise_parameter_sanitizer.for(:sign_up) << :name
     #devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email) }
   end




   protected

   # my custom fields are :name, :heard_how
   def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) do |u|
       u.permit(:name, :username, :email, :password, :password_confirmation, :avatar, :avatar_cache, :image, :image_cache)
     end
     devise_parameter_sanitizer.for(:account_update) do |u|
       u.permit(:name,
         :email, :username, :password, :password_confirmation, :current_password, :avatar, :avatar_cache, :image, :image_cache)
     end
   end
    #  def configure_permitted_parameters
    #    devise_parameter_sanitizer.for(:account_update) << :username
    #    devise_parameter_sanitizer.for(:sign_up) << :username
    #  end
end

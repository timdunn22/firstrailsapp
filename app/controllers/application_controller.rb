class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  before_action :flash_attack, if: :devise_controller?

     rescue_from Pundit::NotAuthorizedError do |exception|
       redirect_to root_url, alert: exception.message
     end
   protected

   def flash_attack
     devise_parameter_sanitizer.for(:sign_up) << :name
     #devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email) }
   end
end

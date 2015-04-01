class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :flash_attack, if: :devise_controller?

   protected

   def flash_attack
     devise_parameter_sanitizer.for(:sign_up) << :name
   end
end

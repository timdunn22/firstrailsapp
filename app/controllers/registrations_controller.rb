class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters
  private

  def user_params
    params.require(:user).permit(:name, :avatar, :avatar_cache)
  end
  protected

end

class UsersController < ApplicationController
   before_action :authenticate_user!
   def create
      User.create!(user_params)
    end
   def update
     redirect_to current_account.users.find(params[:id]).tap { |user|
       person.update!(user_params)
     if current_user.update_attributes(user_params)
       flash[:notice] = "User information updated"
       redirect_to edit_user_registration_path
     else
       flash[:error] = "Invalid user information"
       redirect_to edit_user_registration_path
     end
   end
   def index
     @users = User.top_rated.paginate(page: params[:page], per_page: 10)
  end

   private

   def user_params
     params.require(:user).permit(:name, :avatar, :avatar_cache, :email_favorites)
   end
 end

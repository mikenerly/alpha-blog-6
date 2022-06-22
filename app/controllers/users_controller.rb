class UsersController < ApplicationController
   
   def new
      @user = User.new
   end
   
   def create #the method is for user creation action
      @user = User.new(user_params)
      if @user.save
         flash[:notice] = "Welcome to Alpha Blog #{@user.username} you are successfully signed up"
         redirect_to articles_path
      else
         render 'new' #render the phone allover again
      end
   end
   
   private
      def user_params
         params.require(:user).permit(:username, :email, :password)
      end
end
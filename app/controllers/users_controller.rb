class UsersController < ApplicationController
   before_action :set_user, only: [:show, :edit, :update]
   before_action :require_user, only: [:edit, :update]
   before_action :require_same_user, only: [:edit, :update]
   
   def show
    
      @articles = @user.articles.paginate(page: params[:page], per_page: 5)
   end
   #Define action of index
   def index
      @users = User.paginate(page: params[:page], per_page: 5)
   end
   
   def new
      @user = User.new
   end
   
   def edit
     
   end
   
   def update
     
    if @user.update(user_params)
      flash[:notice] = "Your account information was successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
      
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
      
      def set_user
         @user = User.find(params[:id])
      end
     
     #this code restrict user so can only perform delete or edit action on his own articles
      def require_same_user
          if current_user != @user
            flash[:alert] = "You can only edit your own account"
            redirect_to @user
          end
      end
      
end
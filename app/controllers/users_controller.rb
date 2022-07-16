class UsersController < ApplicationController
   before_action :set_user, only: [:show, :edit, :update]
   before_action :set_user, only: [:show, :edit, :update, :destroy]
   before_action :require_same_user, only: [:edit, :update]
   before_action :require_same_user, only: [:edit, :update, :destroy]
   
   
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
         flash[:notice] = "Welcome to NTIC Blog #{@user.username} you are successfully signed up"
         redirect_to articles_path
      else
         render 'new' #render the phone allover again
      end
   end
   #this destroy action will delete the user upon his request
   def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user #this to release the id of session after delete
    flash[:notice] = "Account and all associated articles successfully deleted"
    redirect_to articles_path
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
          #the first part is to logout user when delete about, to release the session id
          #the second part is to allow adim user to stay login after deleting regular user account
            if current_user != @user && !current_user.admin?
            flash[:alert] = "You can only edit or delete your own account"
            redirect_to @user
          end
      end
      
end
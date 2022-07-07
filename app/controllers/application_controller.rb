class ApplicationController < ActionController::Base
   
    #to make them available for all views
    helper_method :current_user, :logged_in?
    
    #to make those methods available for all controller
   def current_user
        #check if user is login
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        #turn this current_user to boolean
     !!current_user
    end
    
end
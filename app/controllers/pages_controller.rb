class PagesController < ApplicationController
   
   def home
      #to redirect the current login to articles listing page to replace the home page
      redirect_to articles_path if logged_in?
      
   end
    
    def about
        
    end
       
end
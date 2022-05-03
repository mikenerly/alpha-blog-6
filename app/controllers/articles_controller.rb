class ArticlesController < ApplicationController
   
   def show
      
      @article = Article.find(params[:id])
      
   end
   
   #define index#action for root of articles
   def index
       
       @articles = Article.all
       
   end
    
end
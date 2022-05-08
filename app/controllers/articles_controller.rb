class ArticlesController < ApplicationController
   
   def show
      
      @article = Article.find(params[:id])
      
   end
   
   #define index#action for root of articles
   def index
       
       @articles = Article.all
       
   end
   
   #define a action create and new
   def new
      #initiate in instance variable of article in our article controller new action
      @article = Article.new
   end
   #create edit fonction
   def edit
      
      @article = Article.find(params[:id])
   end
   
   
   def create
      #render plain: params[:article]
      @article = Article.new(params.require(:article).permit(:title, :description))
      #render plain: @article.inspect
      #save it to the database
      #adding errors msg is validation failed in a if block
         if @article.save
         #adding a flash helper to display a message when the article is successfully created
         flash[:notice] = "Article was created successfully"
      #redirect to new article following the ID
      #redirect_to article_path(@article)#long path
            redirect_to @article #shorten path
         else
            render 'new'
         end
      
   end
   #create update fonction
   def update
      
     @article = Article.find(params[:id])
      if @article.update(params.require(:article).permit(:title, :description))#to whitelisted title and description
         
         flash[:notice] = "Article was updated successfully."
         redirect_to @article
      else
         render 'edit'
      end
   end
   
end
class ArticlesController < ApplicationController
   #set a helper to a use the action before each method
   before_action :set_article, only: [:show, :edit, :update, :destroy]
   
   def show
      
   end
   
   #define index#action for root of articles
   def index
       
       @articles = @articles = Article.paginate(page: params[:page], per_page: 5)
       
   end
   
   #define a action create and new
   def new
      #initiate in instance variable of article in our article controller new action
      @article = Article.new
   end
   #create edit fonction
   def edit
      #@article = Article.find(params[:id])
   end
   
   
   def create
      #render plain: params[:article]
      #@article = Article.new(params.require(:article).permit(:title, :description))
      #another way by using article_params similar to code above
      @article = Article.new(article_params)

      #@article.user = User.first # <--- Add this line to make articles have a default user in the database
      @article.user = current_user # this is to associate each articles create by its user
      
      
      
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
      
     #@article = Article.find(params[:id])
      #if @article.update(params.require(:article).permit(:title, :description))#to whitelisted title and description
      #add the same line above using article_params method to DRY your code
      if @article.update(article_params)
         
         flash[:notice] = "Article was updated successfully."
         redirect_to @article
      else
         render 'edit'
      end
   end
   #adding the destroy action
   
   def destroy
      #first find the article by id
      #@article = Article.find(params[:id])
      #destroy it
      @article.destroy
      #redirect to listing page of articles
      
      redirect_to articles_path
   end
   
   #Creating private method to group same bunch of code, DRY
   private
   
   def set_article
      @article = Article.find(params[:id])
   end
   #This method whitelisted field "title and description" for extraction of redundancy
   def article_params
      params.require(:article).permit(:title, :description)
   end
   
end
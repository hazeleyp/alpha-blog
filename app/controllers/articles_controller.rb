class ArticlesController < ApplicationController
    #ths helper will pass the set_article action into the listed controller actions
    #this means that the instance variable @article does not need to be set in each action
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show 
    end

    def index
        #find all articles and pass them into an instance variable
        @articles = Article.all 
    end

    def new
        @article = Article.new
    end

    def create
        #the private method areticle_params replaces the previous params variable
        @article = Article.new(article_params)
        @article.user = User.first
        if @article.save
        flash[:notice] = 'Article successfully saved'
        redirect_to @article        
        else
        render 'new'
        end
    end

    def edit
    end

    def update
        if
        @article.update(article_params)
            flash[:notice] = 'Article successfully updated'
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end
end
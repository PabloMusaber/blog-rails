class ArticlesController < ApplicationController
    before_action :find_article, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def index
        @articles = Article.all
    end

    def show
    end

    def edit
        @categories = Category.all
    end

    def update
        @article.update(article_params)
        @article.save_categories
        redirect_to @article
    end

    def new
        @article = Article.new
        @categories = Category.all
    end

    def create
        @article = current_user.articles.new(article_params)
        if !@article.errors
            @article.save_categories
        end
        if @article.save
            redirect_to @article
        else
            @categories = Category.all
            flash[:alert] = @article.errors.full_messages
            render :new
        end
    end

    def destroy
        @article.save_categories
        @article.destroy
        redirect_to root_path
    end

    def from_author
        @user = User.find(params[:user_id])
    end

    def find_article
        @article = Article.find(params[:id])
    end

    def article_params #Convención para nombrar el método de parámetros fuertes
        params.require(:article).permit(:title, :content, category_elements: [])
    end

end

class ArticlesController < ApplicationController

    before_action :set_artice, only: [:edit, :update, :show, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    def show
 
    end

    def index
        @articles=Article.paginate(page: params[:page], per_page: 5)
    end

    def new
        @article=Article.new 
    end


    def edit

    
    end

    def create
        @article= Article.new(article_params)
        @article.user=current_user
        if @article.save
            flash[:notice]="Article was created successfully"
            #redirect_to article_path(@article). # or you can directly write @article 
            redirect_to @article
        else
            render 'new'
        end


    end


    def update

        if @article.update(article_params)
            flash[:notice]="Article was updated"
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

    def set_artice
        @article=Article.find(
        params[:id]
        )
    end

    def article_params
        params.require(:article).permit(:title,:description,category_ids: [])
    end

    def require_same_user
        if current_user != @article.user && !current_user.admin?
            flash[:aleter]="You need to login with the same user in order to edit or delete the article"
            redirect_to @article
        end
    end
end
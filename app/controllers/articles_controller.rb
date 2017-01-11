class ArticlesController < ApplicationController

	http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]

	before_action :article_find, only: [:show, :edit, :update, :destroy]

	def index
		@articles = Article.paginate(page: params[:page], per_page: 5)
	end

  	def show
  	end

	def new
		@article = Article.new
	end

	def edit
	end

	def create
		@article = Article.new(article_params)

		if @article.save
		redirect_to @article, success: 'Статья создана'
		else
		render 'new', info: 'Статья не создана'
		end
	end

	def update
		if @article.update(article_params)
		redirect_to @article, success: 'Статья обновлена'
		else
		render 'edit', danger: 'Статья не обновлена'	
		end	
	end

	def destroy
		@article.destroy
		redirect_to articles_path, danger: 'Статья удалена'
	end

	private

	def article_find
		@article = Article.find(params[:id])
	end

  	def article_params
    	params.require(:article).permit(:title, :text, :image)
  	end

end

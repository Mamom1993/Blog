class CategoriesController < ApplicationController

	before_action :category_find, only: [:show, :edit, :update, :destroy]

	def index
		@categories = Category.paginate(page: params[:page], per_page: 5)
	end

  	def show
  	end

	def new
		@category = Category.new
	end

	def edit
	end

	def create
		@category = Category.new(category_params)

		if @category.save
		redirect_to @category, success: 'Категория создана'
		else
		render 'new', info: 'Категория не создана'
		end
	end

	def update
		if @category.update(category_params)
		redirect_to @category, success: 'Категория обновлена'
		else
		render 'edit', danger: 'Категория не обновлена'	
		end	
	end

	def destroy
		@category.destroy
		redirect_to category_path, danger: 'Категория удалена'
	end

	private

	def category_find
		@category = Category.find(params[:id])
	end

  	def category_params
    	params.require(:category).permit(:name)
  	end

end

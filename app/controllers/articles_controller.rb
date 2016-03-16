class ArticlesController < ApplicationController
	include ArticlesHelper
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.save
		redirect_to article_path(@article)
		#fail halt request to examine parameters
	end

	def destroy
		@article = Article.destroy(params[:id])
		redirect_to articles_path
	end	
end

#Creating an Edit Action & View
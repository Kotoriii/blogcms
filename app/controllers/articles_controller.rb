class ArticlesController < ApplicationController
	before_action :set_article, only: [:show, :edit, :update, :destroy]
	before_filter :require_login, except: [:index, :show]
	respond_to :json, :html
	include ArticlesHelper
	def index
		@articles = Article.all
		@comments = @article.comments.order("created_at DESC")
		respond_with @articles
	end

	def new
		@article = Article.new #Blank article object so Rails figures out fields
	end

	def create
		@article = Article.new(article_params)
		@article.save

		flash.notice = "Article #{@article.title} successfully created."

		redirect_to article_path(@article)
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Article #{@article.title} successfully updated."

		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.destroy(params[:id])

		flash.notice = "Article #{@article.title} successfully deleted."

		redirect_to articles_path
	end	

	def set_article
      @article = Article.find(params[:id])
    end
end

class CommentsController < ApplicationController
	before_filter :require_login, except: [:create]
	def create
    @article = Article.find(params[:article_id])
    @comments = @articles.comment.new(comment_params)
    @comment.author = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @article, notice: 'Review was created successfully.' }
        format.json { render :show, status: :created, location: @article }
        format.js
      else
        format.html { redirect_to @article, alert: 'Review was not saved successfully.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
	def destroy
    @comment = Comment.find(params[:id])
    article = @comment.article
    @comment.destroy
    redirect_to article
	end

	private 

	def comment_params
		params.require(:comment).permit(:author_name, :body)
	end
end

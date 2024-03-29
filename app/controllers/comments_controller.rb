class CommentsController < ApplicationController
    before_action :authenticate_user!, except: %i[index show]
    load_and_authorize_resource


    def index
        @q = Comments.ransack(params[:q])
        @come = @q.result(distinct: true)
      end
    
    def create 
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        @comment.user_id = current_user.id        
        if @comment.save 
            redirect_to article_path(@article)
        else
                        
            flash.now[:danger] ="error"
        end
        
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article), status: :see_other
    end

    private
    def comment_params
        params.require(:comment).permit( :body, :status)
    end
end


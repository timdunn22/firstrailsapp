class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
     @comment = Comment.new(params.require(:comment).permit(:body))
    #  authorize @summary
     if @comment.save
       redirect_to @comment, notice: "Comment was saved successfully."
     else
       flash[:error] = "Error creating comment. Please try again."
       render :new
     end
  end

end

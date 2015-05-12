class CommentsController < ApplicationController
  def create
     @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
     @comment = @post.comments.new(params.require(:comment).permit(:body))
      authorize @comment
     if @comment.save

       flash[:notice] = "Comment was saved successfully."
     else
       flash[:error] = "Error creating comment. Please try again."
      #  render :new
     end
  end

end

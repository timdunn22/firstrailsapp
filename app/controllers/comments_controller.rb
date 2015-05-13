class CommentsController < ApplicationController
  def create
     @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
     @comment = @post.comments.new(params.require(:comment).permit(:body))

      authorize @comment
     if @comment.save
       redirect_to :back, notice: "Comment was saved successfully."

     else
       flash[:error] = "Error creating comment. Please try again."
      #  render :new
     end
  end

end

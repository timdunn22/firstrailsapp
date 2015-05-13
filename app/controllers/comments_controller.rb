class CommentsController < ApplicationController
  def create
     @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    #  @comment = @post.comments.new(params.require(:comment).permit(:body))
    @comment = @post.comments.new(params[:id])
      authorize @comment
     if @comment.save
       redirect_to :back, notice: "Comment was saved successfully."

     else
       flash[:error] = "Error creating comment. Please try again."
      #  render :new
     end
  end
  def destroy
      @topic = Topic.find(params[:topic_id])
      @post = @topic.posts.find(params[:post_id])
      @comment = @post.comments.find(params[:id])

      authorize @comment
      if @comment.destroy
        flash[:notice] = "Comment was removed."
        redirect_to [@topic, @post]
      else
        flash[:error] = "Comment couldn't be deleted. Try again."
        redirect_to [@topic, @post]
      end
    end
end

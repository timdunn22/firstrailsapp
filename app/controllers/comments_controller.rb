class CommentsController < ApplicationController
  def create
     @post = Post.find(params[:post_id])

    # @topic = Topic.find(params[:topic_id])
    @comments = @post.comments

    @comment = current_user.comments.build( comment_params )
    @comment.post = @post

      authorize @comment
     if @comment.save
        flash[:notice] = "Comment was created"
        redirect_to [@post.topic, @post]
     else
       flash[:error] = "There was an error creating comment. Please try again."
       redirect_to [@post.topic, @post]

     end
  end
  def destroy

    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      redirect_to [@post.topic, @post]
    end
  end
private

 def comment_params
   params.require(:comment).permit(:body)
 end

end

class PostsController < ApplicationController

  def index
  @posts = Post.all
  @posts.per_page(100)

  authorize @posts
  @posts = policy_scope(Post)
  end

  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    @summary = Summary.find(params[:id])
    @comment = Comment.find(params[:id])
    @comments = Comment.all
    authorize @comment
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post

  end
  def create
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(post_params)
   authorize @post

   if @post.save
     flash[:notice] = "Post was saved."
     redirect_to @post
   else
     flash[:error] = "There was an error saving the post. Please try again."
     render :new
   end
 end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end
  # def update
  #   @topic = Topic.find(params[:topic_id])
  #    @post = Post.find(params[:id])
  #    authorize @post
  #    if @post = current_user.posts.build(post_params)
  #      flash[:notice] = "Post was updated."
  #     #  redirect_to @post
  #     redirect_to topic_post_path
  #    else
  #      flash[:error] = "There was an error saving the post. Please try again."
  #      render :edit
  #    end
  #  end
  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      flash[:notice] = "Post was updated"
      redirect_to topic_post_path
    else
      flash[:error] = "Invalid Post information"
      render :edit
    end
  end
   skip_before_action :flash_attack, only: [:new, :index]
   private

   def post_params
     params.require(:post).permit(:title, :body, :image, :image_cache)
   end

end

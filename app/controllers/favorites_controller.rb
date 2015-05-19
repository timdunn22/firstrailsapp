class FavoritesController < ApplicationController
  def create

    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)

    authorize favorite
    if favorite.save
      flash[:notice] = "Your favorite is updated"
      redirect_to [post.topic, post]
      # Add code to generate a success flash and redirect to post
      # Remember the path shortcut: [post.topic, post]
    else
      flash[:error] = "There was an error updating your favorite"
      redirect_to [post.topic, post]
      # Add code to generate a failure flash and redirect to post
    end
  end
  def destroy
    @post = Post.find(params[:post_id])
    # @favorite = current_user.favorites.update_attributes(params[:favorite_id])
    favorite = current_user.favorites.find_by_post_id(@post)
    # favorite.post = @post

     authorize favorite
  # Get the post from the params
  # Find the current user's favorite with the ID in the params

    if favorite.destroy
      flash[:notice] = "You have unfavorited this post"
      redirect_to [@post.topic, @post]
      # redirect_to [@post.topic,@post]
      # Flash success and redirect to @post
    else
      flash[:error] = "There was an error updating your favorite"
      redirect_to [@post.topic, @post]
      # redirect_to [@post.topic,@post]
      # Flash error and redirect to @post
    end
  end
end

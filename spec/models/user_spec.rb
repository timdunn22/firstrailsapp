require 'rails_helper'

describe User do



  include TestFactories

  before do
    @post = associated_post
    @user = authenticated_user
    @favorite = @user.favorites.find_by_post_id(@post.id)
      # sign_in @user
    end
  describe "#favorited(post)" do
    it "returns `nil` if the user has not favorited the post" do
      if @favorite == nil
        expect(@user.favorited(@post)).to eq(nil)
      end
    end

    it "returns the appropriate favorite if it exists" do
      if @favorite != nil
        expect(@user.favorited(@post)).to eq(@favorite)
      end
    end

    it "returns `nil` if the user has favorited another post" do
      expect(@user.favorited(@post)).to eq(nil) if @favorite == nil
    end

  end
  describe ".top_rated" do

  before do
    @user1 = create(:user_with_post_and_comment)
    @user2 = create(:user_with_post_and_comment)
    create(:comment, user: @user2, post: @user1.posts.first)

  end

  it "returns users ordered by comments + posts" do
    expect( User.top_rated ).to eq([@user2, @user1])
  end

  it "stores a `posts_count` on user" do
    users = User.top_rated
    expect( users.first.posts_count ).to eq(1)
  end

  it "stores a `comments_count` on user" do
    users = User.top_rated
    expect( users.first.comments_count ).to eq(2)
  end
end
end

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
end

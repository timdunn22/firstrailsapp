require 'rails_helper'
describe Vote do
  describe "validations" do
    before do

            @post = Post.create(title: 'Post title', body: 'Post bodies must be pretty long.')
            3.times {@post.votes.create(value: 1) }
            2.times {@post.votes.create(value: -1) }
          end
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        @post.votes.last.value == 1 || @post.votes.last.value == -1

      end
    end
  end
end

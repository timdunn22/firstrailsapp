require 'rails_helper'

describe Post do
  describe "vote methods" do

    before do
      @post = Post.create(title: 'post title', body: 'post body')
      3.times {@post.votes.create(value: 1) }
      2.times {@post.votes.create(value: -1) }
    end

    describe '#up_votes' do
      it "counts the number of votes with value = 1" do
        except( @post.up_votes ).to eq(3)
      end
    end

    describe '#down_votes' do
      it "countrs the number of votes with value = -1" do
        except( @post.down_votes).to eq(2)
      end
    end

    describe '#points' do
      it "returns the sum of all down and up votes" do
        except( @post.points).to eq(1)
      end
    end
  end
end

describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect(@post.votes.first.value).to eq(1) ||
        expect(@post.votes.first.value).to eq(-1)
        # your expectations here
      end
    end
  end
end

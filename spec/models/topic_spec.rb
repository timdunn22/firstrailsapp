<<<<<<< HEAD
=======
require 'rails_helper'
>>>>>>> private-topics
describe Topic do
  describe "scopes" do

    before do
<<<<<<< HEAD
      @public_topic = Topic.create # default is public
      @private_topic = Topic.create(public: false)
=======
      @public_topic = Topic.create(name: "A public topic", description:("This is an example of a public topic")) # default is public
      @private_topic = Topic.create(name:"A private topic", description:("This is an example of a private topic"),public: false)
>>>>>>> private-topics
    end

    describe "publicly_viewable" do
      it "returns a relation of all public topics" do
        expect(Topic.publicly_viewable).to eq( [@public_topic] )
      end
    end

    describe "privately_viewable" do
      it "returns a relation of all private topics" do
<<<<<<< HEAD
        expect(Topic.privately_viewable).to eq([@private_topic])
=======
        expect(Topic.privately_viewable).to eq( [@private_topic] )
>>>>>>> private-topics
        # Your code here
      end
    end

    describe "visible_to(user)" do
      it "returns all topics if the user is present" do
<<<<<<< HEAD
        user = true # sneaky solution; we don't need a real user, just something truthy
        expect(Topic.visible_to(user)).to eq(Topic.all) if user.present?
        # Your code here
      end

      it "returns only public topics if user is nil" do

        expect(Topic.visible_to(User.first)).to eq(Topic.publicly_viewable) if User.first == nil
        # Your code here
=======
        user = true
        expect(Topic.visible_to(user)).to eq(Topic.all)
      end

      it "returns only public topics if user is nil" do
        expect(Topic.visible_to(nil)).to eq(Topic.publicly_viewable)

>>>>>>> private-topics
      end
    end
  end
end

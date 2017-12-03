require "rails_helper.rb"

describe EventsController do

  before(:each) do
    User.destroy_all
  end

  describe "#new" do
    it "succeeds" do
      expect(response).to be_success
    end
  end

  describe "#create" do
    context "with a (fake) logged in user" do
      let!(:user) { FactoryBot.create(:user) }
      it "creates a new event" do
        sign_in user
        original_count = Event.all.count
        post :create, params: { event: { name: "test"} }
        expect(Event.all.count).to eq original_count + 1
      end
    end
  end
end

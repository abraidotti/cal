require "rails_helper.rb"
require "support/factory_bot.rb"

describe EventsController do

  describe "#new" do
    it "succeeds" do
      expect(response).to be_success
    end
  end

  describe "#create" do
    context "with a (fake) logged in user" do
      let (:user) {FactoryBot.create(:user)}
      # user = build(:user, email: "test@test.com")
      it "creates a new event" do
        sign_in user
        original_count = Event.all.count
        post :create
        binding.pry
        expect(Event.all.count).to eq original_count + 1
      end
    end
  end
end

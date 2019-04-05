require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe "check attributes and methods" do
    it "should be able to create an Vote object" do
      v = Vote.create!(isUpvote: true)
      expect(v).to respond_to :isUpvote
    end
  end
end

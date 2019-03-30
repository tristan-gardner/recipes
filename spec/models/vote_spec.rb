require 'rails_helper'
Rspec.describe Vote, type: :model do
  describe "check attributes and methods" do
    it "should be able to create an Vote object" do
      v = Vote.create!(:up true)
      expect(v).to respond_to :up
    end
  end
end

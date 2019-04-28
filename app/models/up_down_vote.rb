class UpDownVote < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  def to_s
    return "self.upvote"
  end
end

class Recipe < ApplicationRecord
  has_many_attached :images
  has_many :reviews
  has_and_belongs_to_many :ingredients
  belongs_to :user
  has_many :up_down_votes
  has_many :users, :through => :up_down_votes

  def upvotes
    self.up_down_votes.where("upvote = ?", true).count
  end

  def downvotes
    self.up_down_votes.where("upvote = ?", false).count
  end

  def hasUpvoter?(user)
    hasUpOrDownvoter?(user, true)
  end

  def hasDownvoter?(user)
    return hasUpOrDownvoter?(user, false)
  end

  def removeVote(user)
    vote = self.up_down_votes.where("user_id = ?", user.id)[0]
    if vote
      vote.destroy
    else
    end
  end

  private
  def hasUpOrDownvoter?(user, up)
    if self.users.include?(user)
      vote = self.up_down_votes.where("user_id = ?", user.id)[0]
      return vote.upvote == up
    end
  end

  def self.most_similar_ingredients(recipe)
    max_matches = 0
    most_similar = nil
    Recipe.all.includes(:ingredients).each do |other|
      if other.id != recipe.id
        num_matches = Recipe.count_matching_ingredients(recipe, other)
        if num_matches > max_matches
          max_matches = num_matches
          most_similar = other
        end
      end
    end
    return most_similar
  end

  def self.count_matching_ingredients(r1, r2)
    union = (r1.ingredients + r2.ingredients).uniq
    diff = (r1.ingredients - r2.ingredients | r2.ingredients - r1.ingredients)
    intersection = union - diff
    return intersection.size
  end

  def self.filter_on_constraints(constraint_hash)
    recipes = Recipe.all

    operator_hash = {
        :calories => '<=',
        :cuisine => 'LIKE',
    }
    #byebug
    constraint_hash.each_pair do |key, value|
      symbol = key.to_sym
      operator = operator_hash[symbol]
      if symbol == :ingredient and constraint_hash[:ingredient] != ""
        recipes = Recipe.joins(:ingredients).where("ingredients.name LIKE ?", value)
      elsif !operator.nil? and value != ""
        recipes = recipes.where("#{symbol.to_s} #{operator} ?", value)
      end

    end
    recipes
  end
end

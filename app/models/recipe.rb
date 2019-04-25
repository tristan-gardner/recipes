class Recipe < ApplicationRecord
  has_many_attached :images
  has_many :reviews
  has_and_belongs_to_many :ingredients
  belongs_to :user
  attr_accessor :ingredient_raw_text
  has_many :up_down_votes
  has_many :users, :through => :up_down_votes

  def upvotes
    self.up_down_votes.where("upvote = ?", true).count
  end

  def downvotes
    self.up_down_votes.where("upvote = ?", false).count
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
      if !operator.nil? and value != ""
        recipes = recipes.where("#{symbol.to_s} #{operator} ?", value)
      end
    end
    recipes
  end
end

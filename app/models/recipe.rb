class Recipe < ApplicationRecord
  has_many_attached :images
  has_many :reviews
  has_and_belongs_to_many :ingredients
  belongs_to :user
  attr_accessor :ingredient_raw_text


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

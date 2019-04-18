class AddReviewsToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :recipe_id, :integer
    add_index :reviews, :recipe_id
  end
end

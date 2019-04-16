class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string "name", null:false
      t.timestamps
    end

    create_join_table :ingredients, :recipes
  end
end

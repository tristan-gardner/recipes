class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string "name", null:false
      t.text "directions"
      t.string "cuisine"
      t.integer "calories"
      t.timestamps
    end
  end
end

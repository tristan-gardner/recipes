class CreateUpDownVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :up_down_votes do |t|
      t.boolean :upvote, null: false
      t.references :user, foreign_key: true
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end

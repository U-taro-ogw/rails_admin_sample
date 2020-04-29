class CreateTennisGameScores < ActiveRecord::Migration[6.0]
  def change
    create_table :tennis_game_scores do |t|
      t.references :tennis_game, foreign_key: true
      t.integer :first_set_first_player
      t.integer :first_set_second_player
      t.integer :second_set_first_player
      t.integer :second_set_second_player
      t.integer :third_set_first_player
      t.integer :third_set_second_player
      t.timestamps
    end
  end
end

class CreateTennisGames < ActiveRecord::Migration[6.0]
  def change
    create_table :tennis_games do |t|
      t.timestamp :game_date
      t.string :first_player_identifier, null: false
      t.string :second_player_identifier, null: false
      t.integer :result, null: false

      t.timestamps
    end
  end
end

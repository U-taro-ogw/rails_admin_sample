class CreateTennisPlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :tennis_players do |t|
      t.string :name, null: false
      t.integer :age
      # やんごとなき理由によって`player_identifier`を外部キーにしなければいけない場合を想定
      t.string :player_identifier, null: false

      t.timestamps
    end
    add_index :tennis_players, :player_identifier, unique: true
  end
end

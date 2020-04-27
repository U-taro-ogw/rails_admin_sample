class TennisGame < ApplicationRecord
  belongs_to :first_player, primary_key: 'player_identifier', foreign_key: 'first_player_identifier', class_name: 'TennisPlayer', inverse_of: :first_games
  belongs_to :second_player, primary_key: 'player_identifier', foreign_key: 'first_player_identifier', class_name: 'TennisPlayer', inverse_of: :second_games
end

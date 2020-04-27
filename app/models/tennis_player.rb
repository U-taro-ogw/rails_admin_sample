class TennisPlayer < ApplicationRecord
  has_many :first_games, primary_key: 'player_identifier', foreign_key: 'first_player_identifier', class_name: 'TennisGame', dependent: :restrict_with_error, inverse_of: :first_player
  has_many :second_games, primary_key: 'player_identifier', foreign_key: 'first_player_identifier', class_name: 'TennisGame', dependent: :restrict_with_error, inverse_of: :second_player
end

class TennisGame < ApplicationRecord
  has_paper_trail

  enum result: { first_player_win: 0, second_player_win: 1, game_canceled: 2 }

  belongs_to :first_player, primary_key: 'player_identifier', foreign_key: 'first_player_identifier', class_name: 'TennisPlayer', inverse_of: :first_games
  belongs_to :second_player, primary_key: 'player_identifier', foreign_key: 'second_player_identifier', class_name: 'TennisPlayer', inverse_of: :second_games

  has_one :tennis_game_score

  def to_attributes
    attributes.delete_if { |k, _| %w[created_at updated_at].include?(k) }
  end
end

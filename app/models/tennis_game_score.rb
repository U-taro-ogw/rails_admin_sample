class TennisGameScore < ApplicationRecord
  has_paper_trail

  belongs_to :tennis_game

  def to_attributes
    attributes.delete_if { |k, _| %w[created_at updated_at tennis_game_id].include?(k) }
  end
end

module Admin
  class TennisGameForm
    include ActiveModel::Model

    attr_accessor :id,
                  :game_date,
                  :first_player_identifier,
                  :second_player_identifier,
                  :result,
                  :first_set_first_player,
                  :first_set_second_player,
                  :second_set_first_player,
                  :second_set_second_player,
                  :third_set_first_player,
                  :third_set_second_player

    validates :game_date, presence: true
    validates :first_player_identifier, presence: true
    validates :second_player_identifier, presence: true
    validates :result, presence: true
    validates :first_set_first_player, numericality: { only_integer: true }, allow_blank: true
    validates :first_set_second_player, numericality: { only_integer: true }, allow_blank: true
    validates :second_set_first_player, numericality: { only_integer: true }, allow_blank: true
    validates :second_set_second_player, numericality: { only_integer: true }, allow_blank: true
    validates :third_set_first_player, numericality: { only_integer: true }, allow_blank: true
    validates :third_set_second_player, numericality: { only_integer: true }, allow_blank: true

    def save
      return false if invalid?

      tennis_game = TennisGame.new(to_tennis_game_attribute)
      tennis_game.tennis_game_score = TennisGameScore.new(to_tennis_game_score_attributes)

      tennis_game.save
    end

    def update(game_id)
      return false if invalid?

      tennis_game = TennisGame.find(game_id)
      tennis_game.tennis_game_score.update(to_tennis_game_score_attributes)
      tennis_game.update(to_tennis_game_attribute)
    end

    private
      def to_tennis_game_attribute
        {
            game_date: game_date,
            first_player_identifier: first_player_identifier,
            second_player_identifier: second_player_identifier,
            result: result,
        }
      end

      def to_tennis_game_score_attributes
        {
            first_set_first_player: first_set_first_player,
            first_set_second_player: first_set_second_player,
            second_set_first_player: second_set_first_player,
            second_set_second_player: second_set_second_player,
            third_set_first_player: third_set_first_player,
            third_set_second_player: third_set_second_player,
        }
      end
  end
end

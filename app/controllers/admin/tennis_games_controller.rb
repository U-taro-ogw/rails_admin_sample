module Admin
  class TennisGamesController < AdminController
    def index
      @tennis_games = TennisGame.all
    end

    def new
      @tennis_game_form = Admin::TennisGameForm.new
    end

    def create
      @tennis_game_form = Admin::TennisGameForm.new(tennis_game_param)

      if @tennis_game_form.save
        redirect_to admin_tennis_games_path
      else
        render :new
      end
    end

    def edit
      tennis_game = TennisGame.find(params[:id])
      tennis_game_score_attributes = tennis_game.tennis_game_score.to_attributes
      initialize_attributes = tennis_game.to_attributes.merge(tennis_game_score_attributes)
      @tennis_game_form = Admin::TennisGameForm.new(initialize_attributes)
    end

    def update
      @tennis_game_form = Admin::TennisGameForm.new(tennis_game_param)

      if @tennis_game_form.update(params[:id])
        redirect_to admin_tennis_games_path
      else
        @tennis_game_form.id = params[:id]
        render :edit
      end

    end

    private
      def tennis_game_param
        params.require(:admin_tennis_game_form).permit(
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
        )
      end
  end
end



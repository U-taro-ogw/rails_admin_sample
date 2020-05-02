module Admin
  class TennisGamesController < ApplicationController
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

    private
      def tennis_game_param
        params.require(:admin_tennis_game_form).permit(
          :game_date,
          :first_player,
          :second_player,
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



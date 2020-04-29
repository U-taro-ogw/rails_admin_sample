module Admin
  class TennisGamesController < ApplicationController
    def index
      @tennis_games = TennisGame.all
    end

    def new
      @tennis_game_form = TennisGameForm.new
    end
  end
end

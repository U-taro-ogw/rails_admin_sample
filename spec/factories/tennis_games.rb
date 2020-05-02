FactoryBot.define do
  factory :tennis_game do
    game_date { Time.now }
    first_player_identifier { TennisPlayer.first.player_identifier }
    second_player_identifier { TennisPlayer.second.player_identifier }
    result { 1 }
  end
end
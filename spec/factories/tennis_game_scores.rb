FactoryBot.define do
  factory :tennis_game_score do
    tennis_game

    first_set_first_player { 1 }
    first_set_second_player { 2 }
    second_set_first_player { 3 }
    second_set_second_player { 4 }
    third_set_first_player { 5 }
    third_set_second_player { 6 }
  end
end

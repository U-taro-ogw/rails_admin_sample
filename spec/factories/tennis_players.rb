FactoryBot.define do
  factory :tennis_player do
    name { 'player_name' }
    age { 20 }
    sequence(:player_identifier) { |n| "player_identifier#{n}" }
  end
end
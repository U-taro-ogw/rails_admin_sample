# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

4.times do |i|
  player_name = 'player_name' + i.to_s
  TennisPlayer.create!(
      name: player_name,
      age: 20 + i,
      player_identifier: i.to_s + player_name,
  )
end

g1 = TennisGame.create!(
  game_date: Time.zone.now - 1.days,
  first_player_identifier: TennisPlayer.find(1).player_identifier,
  second_player_identifier: TennisPlayer.find(2).player_identifier,
  result: 0,
)

TennisGameScore.create!(
  tennis_game: g1,
  first_set_first_player: 4,
  first_set_second_player: 6,
  second_set_first_player: 7,
  second_set_second_player: 5,
  third_set_first_player: 4,
  third_set_second_player: 6,
)

g2 = TennisGame.create!(
  game_date: Time.zone.now - 2.days,
  first_player_identifier: TennisPlayer.find(3).player_identifier,
  second_player_identifier: TennisPlayer.find(4).player_identifier,
  result: 1,
)

TennisGameScore.create!(
  tennis_game: g2,
  first_set_first_player: 6,
  first_set_second_player: 0,
  second_set_first_player: 7,
  second_set_second_player: 5
)

Administrator.create(email: 'hoge@example.com', password: 'hoge', password_confirmation: 'hoge', role: 0)
Administrator.create(email: 'fuga@example.com', password: 'fuga', password_confirmation: 'fuga', role: 1)
Administrator.create(email: 'piyo@example.com', password: 'piyo', password_confirmation: 'piyo', role: 2)
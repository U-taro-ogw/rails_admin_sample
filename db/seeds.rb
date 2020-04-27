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

2.times do |i|
  TennisGame.create!(
    game_date: Time.zone.now + i.days,
    first_player_identifier: TennisPlayer.find(1).player_identifier,
    second_player_identifier: TennisPlayer.find(2).player_identifier,
  )
end
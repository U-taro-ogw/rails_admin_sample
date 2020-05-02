

require 'rails_helper'

RSpec.describe Admin::TennisGameForm do
  let!(:player_1) { create(:tennis_player) }
  let!(:player_2) { create(:tennis_player) }

  let(:tennis_game_form) { described_class.new(init_attributes) }
  let(:now) { '2020-05-02 10:10:10' }

  shared_context 'update以外の場合' do
    let(:init_attributes) do
      {
          game_date: now,
          first_player: player_1.player_identifier,
          second_player: player_2.player_identifier,
          result: result,
          first_set_first_player: 1,
          first_set_second_player: 2,
          second_set_first_player: 3,
          second_set_second_player: 4,
          third_set_first_player: 5,
          third_set_second_player: 6,
      }
    end
  end

  shared_context 'updateの場合' do
    let(:init_attributes) do
      {
          game_date: now,
          first_player: player_1.player_identifier,
          second_player: player_2.player_identifier,
          result: result,
          first_set_first_player: 6,
          first_set_second_player: 5,
          second_set_first_player: 4,
          second_set_second_player: 3,
          third_set_first_player: 2,
          third_set_second_player: 1,
      }
    end
  end

  describe 'valid' do
    include_context 'update以外の場合'

    let(:result) { 1 }
    it do
      expect(tennis_game_form).to be_valid
    end
  end

  describe 'invalid' do
    include_context 'update以外の場合'

    let(:result) { nil }
    it do
      expect(tennis_game_form).to be_invalid
    end
  end

  describe 'save' do
    include_context 'update以外の場合'

    context 'バリデーションエラーが発生しない場合' do
      let(:result) { 1 }

      it 'レコードを保存する' do
        expect(tennis_game_form.save).to eq true
        expect{ tennis_game_form.save }.to change(TennisGame, :count).by(1)
        expect{ tennis_game_form.save }.to change(TennisGameScore, :count).by(1)
      end

      it 'パラメータ通りの値で保存する' do
        tennis_game_form.save

        tennis_game = TennisGame.last
        expect(tennis_game.game_date).to eq init_attributes[:game_date]
        expect(tennis_game.first_player_identifier).to eq init_attributes[:first_player]
        expect(tennis_game.second_player_identifier).to eq init_attributes[:second_player]
        # enumの整数値で比較
        expect(tennis_game.result_before_type_cast).to eq init_attributes[:result]

        tennis_game_score = TennisGameScore.last
        expect(tennis_game_score.first_set_first_player).to eq init_attributes[:first_set_first_player]
        expect(tennis_game_score.first_set_second_player).to eq init_attributes[:first_set_second_player]
        expect(tennis_game_score.second_set_first_player).to eq init_attributes[:second_set_first_player]
        expect(tennis_game_score.second_set_second_player).to eq init_attributes[:second_set_second_player]
        expect(tennis_game_score.third_set_first_player).to eq init_attributes[:third_set_first_player]
        expect(tennis_game_score.third_set_second_player).to eq init_attributes[:third_set_second_player]
      end
    end

    context 'バリデーションエラーが発生する場合' do
      let(:result) { nil }

      it 'レコードを保存しない' do
        expect(tennis_game_form.save).to eq false
        expect{ tennis_game_form.save }.to change(TennisGame, :count).by(0)
        expect{ tennis_game_form.save }.to change(TennisGameScore, :count).by(0)
      end
    end
  end

  describe 'update' do
    let!(:tennis_game) { create(:tennis_game) }
    let!(:tennis_game_score) { create(:tennis_game_score, tennis_game: tennis_game) }

    include_context 'updateの場合'

    before { tennis_game_form.update(tennis_game.id) }

    context 'バリデーションエラーが発生しない場合' do
      let(:result) { 2 }

      it 'パラメータ通りの値で更新する' do
        after_tennis_game = TennisGame.find(tennis_game.id)
        expect(after_tennis_game.id).to eq tennis_game.id
        expect(after_tennis_game.game_date).to eq init_attributes[:game_date]
        expect(after_tennis_game.first_player_identifier).to eq init_attributes[:first_player]
        expect(after_tennis_game.second_player_identifier).to eq init_attributes[:second_player]

        after_tennis_game_score = after_tennis_game.tennis_game_score
        expect(after_tennis_game_score.first_set_first_player).to eq init_attributes[:first_set_first_player]
        expect(after_tennis_game_score.first_set_second_player).to eq init_attributes[:first_set_second_player]
        expect(after_tennis_game_score.second_set_first_player).to eq init_attributes[:second_set_first_player]
        expect(after_tennis_game_score.second_set_second_player).to eq init_attributes[:second_set_second_player]
        expect(after_tennis_game_score.third_set_first_player).to eq init_attributes[:third_set_first_player]
        expect(after_tennis_game_score.third_set_second_player).to eq init_attributes[:third_set_second_player]
      end
    end

    context 'バリデーションエラーが発生する場合' do
      let(:result) { nil }

      it '更新しない' do
        after_tennis_game = TennisGame.find(tennis_game.id)
        expect(after_tennis_game.id).to eq tennis_game.id
        expect(after_tennis_game.game_date).to eq tennis_game.game_date
        expect(after_tennis_game.first_player_identifier).to eq tennis_game.first_player_identifier
        expect(after_tennis_game.second_player_identifier).to eq tennis_game.second_player_identifier

        after_tennis_game_score = after_tennis_game.tennis_game_score
        expect(after_tennis_game_score.first_set_first_player).to eq tennis_game_score.first_set_first_player
        expect(after_tennis_game_score.first_set_second_player).to eq tennis_game_score.first_set_second_player
        expect(after_tennis_game_score.second_set_first_player).to eq tennis_game_score.second_set_first_player
        expect(after_tennis_game_score.second_set_second_player).to eq tennis_game_score.second_set_second_player
        expect(after_tennis_game_score.third_set_first_player).to eq tennis_game_score.third_set_first_player
        expect(after_tennis_game_score.third_set_second_player).to eq tennis_game_score.third_set_second_player
      end
    end
  end
end
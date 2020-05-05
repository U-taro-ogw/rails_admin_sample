require 'rails_helper'

RSpec.describe "AdministratorSessions", type: :system do
  it 'ログイン画面が表示されること' do
    visit '/sessions/new'
  end
end
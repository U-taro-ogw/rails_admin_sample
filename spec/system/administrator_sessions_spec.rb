require 'rails_helper'

RSpec.describe "AdministratorSessions", type: :system do
  it 'ログイン画面が表示されること' do
    visit login_path
    expect(page).to have_content('Email')
  end
end
require 'rails_helper'

RSpec.describe 'Dashboards', type: :system do
  before do
    visit login_path
    click_button 'Login'
    fill_in 'administrator[email]', with: administrator.email
    fill_in 'administrator[password]', with: administrator.password

    wait 5

    click_button 'Login'
  end

  describe 'ダッシュボードページ' do
    context 'ロールA' do
      let!(:administrator) { create(:administrator, :role_A, email: 'role_A@example.com') }
      it do
        expect(page).to have_content('Admin::Dashboards#index')
      end
    end

    context 'ロールB' do
      let!(:administrator) { create(:administrator, :role_B, email: 'role_B@example.com') }
      it do
        expect(page).to have_content('Admin::Dashboards#index')
      end
    end

    context 'ロールC' do
      let!(:administrator) { create(:administrator, :role_C, email: 'role_C@example.com') }
      it do
        expect(page).to have_content('Admin::Dashboards#index')
      end
    end
  end
end

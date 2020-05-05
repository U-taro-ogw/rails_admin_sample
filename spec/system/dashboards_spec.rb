require 'rails_helper'

RSpec.describe 'Dashboards', type: :system do
  describe 'ダッシュボードページ' do
    context 'ロールA' do
      let!(:role_A_admin) { create(:administrator, :role_A, email: 'role_A@example.com') }
      it do
        visit
      end
    end

    context 'ロールB' do
      let!(:role_B_admin) { create(:administrator, :role_B, email: 'role_B@example.com') }
      it do
        visit
      end
    end

    context 'ロールC' do
      let!(:role_C_admin) { create(:administrator, :role_C, email: 'role_C@example.com') }
      it do
        visit
      end
    end
  end
end

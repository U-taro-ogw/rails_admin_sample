require 'rails_helper'

RSpec.describe "admin/administrators/edit", type: :view do
  before(:each) do
    @admin_administrator = assign(:admin_administrator, Administrator.create!(
      email: "MyString",
      crypted_password: "MyString",
      salt: "MyString"
    ))
  end

  it "renders the edit admin_administrator form" do
    render

    assert_select "form[action=?][method=?]", admin_administrator_path(@admin_administrator), "post" do

      assert_select "input[name=?]", "admin_administrator[email]"

      assert_select "input[name=?]", "admin_administrator[crypted_password]"

      assert_select "input[name=?]", "admin_administrator[salt]"
    end
  end
end

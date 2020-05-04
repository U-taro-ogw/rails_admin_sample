require 'rails_helper'

RSpec.describe "admin/administrators/new", type: :view do
  before(:each) do
    assign(:admin_administrator, Administrator.new(
      email: "MyString",
      crypted_password: "MyString",
      salt: "MyString"
    ))
  end

  it "renders new admin_administrator form" do
    render

    assert_select "form[action=?][method=?]", admin_administrators_path, "post" do

      assert_select "input[name=?]", "admin_administrator[email]"

      assert_select "input[name=?]", "admin_administrator[crypted_password]"

      assert_select "input[name=?]", "admin_administrator[salt]"
    end
  end
end

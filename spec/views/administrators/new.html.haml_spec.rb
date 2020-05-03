require 'rails_helper'

RSpec.describe "administrators/new", type: :view do
  before(:each) do
    assign(:administrator, Administrator.new(
      email: "MyString",
      crypted_password: "MyString",
      salt: "MyString"
    ))
  end

  it "renders new administrator form" do
    render

    assert_select "form[action=?][method=?]", administrators_path, "post" do

      assert_select "input[name=?]", "administrator[email]"

      assert_select "input[name=?]", "administrator[crypted_password]"

      assert_select "input[name=?]", "administrator[salt]"
    end
  end
end

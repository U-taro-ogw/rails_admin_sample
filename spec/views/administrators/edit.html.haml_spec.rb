require 'rails_helper'

RSpec.describe "administrators/edit", type: :view do
  before(:each) do
    @administrator = assign(:administrator, Administrator.create!(
      email: "MyString",
      crypted_password: "MyString",
      salt: "MyString"
    ))
  end

  it "renders the edit administrator form" do
    render

    assert_select "form[action=?][method=?]", administrator_path(@administrator), "post" do

      assert_select "input[name=?]", "administrator[email]"

      assert_select "input[name=?]", "administrator[crypted_password]"

      assert_select "input[name=?]", "administrator[salt]"
    end
  end
end

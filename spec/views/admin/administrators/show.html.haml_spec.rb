require 'rails_helper'

RSpec.describe "admin/administrators/show", type: :view do
  before(:each) do
    @admin_administrator = assign(:admin_administrator, Administrator.create!(
      email: "Email",
      crypted_password: "Crypted Password",
      salt: "Salt"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Crypted Password/)
    expect(rendered).to match(/Salt/)
  end
end

 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/administrators", type: :request do
  # Administrator. As you add validations to Administrator, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Administrator.create! valid_attributes
      get admin_administrators_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      administrator = Administrator.create! valid_attributes
      get admin_administrator_url(administrator)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_admin_administrator_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      administrator = Administrator.create! valid_attributes
      get edit_admin_administrator_url(administrator)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Administrator" do
        expect {
          post admin_administrators_url, params: { admin_administrator: valid_attributes }
        }.to change(Administrator, :count).by(1)
      end

      it "redirects to the created admin_administrator" do
        post admin_administrators_url, params: { admin_administrator: valid_attributes }
        expect(response).to redirect_to(admin_administrator_url(Administrator.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Administrator" do
        expect {
          post admin_administrators_url, params: { admin_administrator: invalid_attributes }
        }.to change(Administrator, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post admin_administrators_url, params: { admin_administrator: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested admin_administrator" do
        administrator = Administrator.create! valid_attributes
        patch admin_administrator_url(administrator), params: { administrator: new_attributes }
        administrator.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the admin_administrator" do
        administrator = Administrator.create! valid_attributes
        patch admin_administrator_url(administrator), params: { administrator: new_attributes }
        administrator.reload
        expect(response).to redirect_to(administrator_url(administrator))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        administrator = Administrator.create! valid_attributes
        patch admin_administrator_url(administrator), params: { administrator: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested admin_administrator" do
      administrator = Administrator.create! valid_attributes
      expect {
        delete admin_administrator_url(administrator)
      }.to change(Administrator, :count).by(-1)
    end

    it "redirects to the administrators list" do
      administrator = Administrator.create! valid_attributes
      delete admin_administrator_url(administrator)
      expect(response).to redirect_to(admin_administrators_url)
    end
  end
end

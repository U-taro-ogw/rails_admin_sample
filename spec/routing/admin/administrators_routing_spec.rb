require "rails_helper"

RSpec.describe Admin::AdministratorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/admin/administrators").to route_to("admin/administrators#index")
    end

    it "routes to #new" do
      expect(get: "/admin/administrators/new").to route_to("admin/administrators#new")
    end

    it "routes to #show" do
      expect(get: "/admin/administrators/1").to route_to("admin/administrators#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/admin/administrators/1/edit").to route_to("admin/administrators#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/admin/administrators").to route_to("admin/administrators#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/admin/administrators/1").to route_to("admin/administrators#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/admin/administrators/1").to route_to("admin/administrators#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/admin/administrators/1").to route_to("admin/administrators#destroy", id: "1")
    end
  end
end

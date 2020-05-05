module Admin
  class AdministratorsLoyalty < ApplicationLoyalty
    def index?
      role_A?
    end
  end
end

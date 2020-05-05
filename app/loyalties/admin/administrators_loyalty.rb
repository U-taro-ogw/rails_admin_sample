module Admin
  class AdministratorsLoyalty < ApplicationLoyalty
    def index?
      role_A?
    end

    def new?
      role_A?
    end

    def edit?
      role_A?
    end

    def create?
      role_A?
    end

    def update?
      role_A?
    end
  end
end

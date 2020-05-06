module Admin
  class TennisGamesLoyalty < ApplicationLoyalty
    def index?
      all_role
    end

    def new?
      role_A? || role_B?
    end

    def create?
      role_A? || role_B?
    end

    def edit?
      role_A? || role_B?
    end

    def update?
      role_A? || role_B?
    end
  end
end

module Admin
  class DashboardsController < ApplicationController
    before_action :require_login
    protect_from_forgery with: :exception

    def index
    end

    private
      def not_authenticated
        redirect_to login_path, alert: "please login first"
      end
  end
end

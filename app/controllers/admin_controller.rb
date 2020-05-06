class AdminController < ApplicationController
  include Banken
  before_action :require_login
  rescue_from Banken::NotAuthorizedError, with: :not_authorized

  private
    def not_authenticated
      redirect_to(login_path, alert: "please login first")
    end

    def not_authorized
      render "layouts/errors/forbidden", status: 403
    end
end

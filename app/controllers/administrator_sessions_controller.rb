class AdministratorSessionsController < ApplicationController
  def new
    @administrator = Administrator.new
  end

  def create
    @administrator = login(params[:email], params[:password])
    if @administrator
      redirect_to(root_path, notice: 'login successful!!!')
    else
      flash.now[:alert] = 'login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(login_path, notice: 'logged out!')
  end
end

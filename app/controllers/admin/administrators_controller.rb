module Admin
  class AdministratorsController < AdminController
    before_action :set_paper_trail_whodunnit
    before_action :set_administrator, only: [:show, :edit, :update, :destroy]

    # GET /administrators
    def index
      authorize!
      @administrators = Administrator.all
    end

    # GET /administrators/new
    def new
      @administrator = Administrator.new
    end

    # GET /administrators/1/edit
    def edit
    end

    # POST /administrators
    def create
      @administrator = Administrator.new(administrator_params)

      respond_to do |format|
        if @administrator.save
          format.html { redirect_to admin_administrators_path, notice: 'Administrator was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    # PATCH/PUT /administrators/1
    def update
      respond_to do |format|
        if @administrator.update(administrator_params)
          format.html { redirect_to admin_administrators_path, notice: 'Administrator was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_administrator
        @administrator = Administrator.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def administrator_params
        params.require(:administrator).permit(:email, :password, :password_confirmation, :role)
      end
  end
end

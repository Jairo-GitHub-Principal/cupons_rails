class CuponsController < ApplicationController
  before_action :set_cupon, only: %i[ show edit update destroy ]

  # GET /cupons or /cupons.json
  def index
    @cupons = Cupon.all
  end

  # GET /cupons/1 or /cupons/1.json
  def show
  end

  # GET /cupons/new
  def new
    @cupon = Cupon.new
  end

  # GET /cupons/1/edit
  def edit
  end

  # POST /cupons or /cupons.json
  def create
    @cupon = Cupon.new(cupon_params)

    respond_to do |format|
      if @cupon.save
        format.html { redirect_to @cupon, notice: "Cupon was successfully created." }
        format.json { render :show, status: :created, location: @cupon }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cupon.errors, status: :unprocessable_entity }
      end
    end
  end


  def validar 
    @cupon = Cupon.find(params[:id])
    if @cupon.valido?
      flash[:notice] = "Cupon Valido"
      flash[:valido_id] = @cupon.id
      flash[:valido] = true
    else
      flash[:alert] = "Cupon Expirado"
      flash[:valido_id] = @cupon.id
      flash[:valido] = false
    end

    redirect_to cupon_path

  end

  # PATCH/PUT /cupons/1 or /cupons/1.json
  def update
    respond_to do |format|
      if @cupon.update(cupon_params)
        nova_data = params[:cupon][:nova_data_de_criacao]
        if nova_data.present?
          @cupon.update_column(:created_at, Date.parse(nova_data).beginning_of_day)
        end

        format.html { redirect_to @cupon, notice: "Cupon was successfully updated." }
        format.json { render :show, status: :ok, location: @cupon }
        
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cupons/1 or /cupons/1.json
  def destroy
    @cupon.destroy!

    respond_to do |format|
      format.html { redirect_to cupons_path, status: :see_other, notice: "Cupon was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cupon
      @cupon = Cupon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cupon_params
      params.require(:cupon).permit(:description, :url_image, :code_id, :validade, :nova_data_de_criacao)
    end
end

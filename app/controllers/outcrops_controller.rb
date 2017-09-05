class OutcropsController < ApplicationController
  before_action :set_outcrop, only: [:show, :edit, :update, :destroy]

  # GET /outcrops
  # GET /outcrops.json
  def index
    @outcrops = Outcrop.paginate(page: params[:page], per_page: params[:size]).all
    render json: @outcrops
  end

  # GET /outcrops/1
  # GET /outcrops/1.json
  def show
    render json: @outcrop
  end

  # GET /outcrops/new
  def new
    @outcrop = Outcrop.new
  end

  # GET /outcrops/1/edit
  def edit
  end

  # POST /outcrops
  # POST /outcrops.json
  def create
    @outcrop = Outcrop.new(outcrop_params)

    respond_to do |format|
      if @outcrop.save
        format.html { redirect_to @outcrop, notice: 'Outcrop was successfully created.' }
        format.json { render :show, status: :created, location: @outcrop }
      else
        format.html { render :new }
        format.json { render json: @outcrop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /outcrops/1
  # PATCH/PUT /outcrops/1.json
  def update
    respond_to do |format|
      if @outcrop.update(outcrop_params)
        format.html { redirect_to @outcrop, notice: 'Outcrop was successfully updated.' }
        format.json { render :show, status: :ok, location: @outcrop }
      else
        format.html { render :edit }
        format.json { render json: @outcrop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outcrops/1
  # DELETE /outcrops/1.json
  def destroy
     if @outcrop.destroy
        head :no_content
     end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outcrop
      @outcrop = Outcrop.find(params[:uuid])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def outcrop_params
      params.require(:outcrop).permit(:uuid, :altitude, :date_time, :description, :horizontal_datum, :latitude, :longitude, :name, :toponomy, :stage_uuid)
    end
end

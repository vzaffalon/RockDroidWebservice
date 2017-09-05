class StructuresController < ApplicationController
  before_action :set_structure, only: [:show, :edit, :update, :destroy]

  before_action :underscore_params!

  def underscore_params!
    underscore_hash = -> (hash) do
      hash.transform_keys!(&:underscore)
      hash.each do |key, value|
        if value.is_a?(ActionController::Parameters)
          underscore_hash.call(value)
        elsif value.is_a?(Array)
          value.each do |item|
            next unless item.is_a?(ActionController::Parameters)
            underscore_hash.call(item)
          end
        end
      end
    end
    underscore_hash.call(params)
  end


  # GET /structures
  # GET /structures.json
  def index
    @structures = Structure.paginate(page: params[:page], per_page: params[:size]).all
    render json: @structures
  end

  # GET /structures/1
  # GET /structures/1.json
  def show
    render json: @structure
  end

  # GET /structures/new
  def new
    @structure = Structure.new
  end

  # GET /structures/1/edit
  def edit
  end

  # POST /structures
  # POST /structures.json
  def create
    @structure = Structure.new(structure_params)

    respond_to do |format|
      if @structure.save
        format.html { redirect_to @structure, notice: 'Structure was successfully created.' }
        format.json { render :show, status: :created, location: @structure }
      else
        format.html { render :new }
        format.json { render json: @structure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /structures/1
  # PATCH/PUT /structures/1.json
  def update
    respond_to do |format|
      if @structure.update(structure_params)
        format.json { render :show, status: :ok, location: @structure }
      else
        format.json { render json: @structure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /structures/1
  # DELETE /structures/1.json
  def destroy
    @structure.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_structure
      @structure = Structure.find(params[:uuid])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def structure_params
      params.require(:structure).permit(:uuid, :description, :dip, :dip_direction, :name, :phase, :type, :outcrop_uuid)
    end
end

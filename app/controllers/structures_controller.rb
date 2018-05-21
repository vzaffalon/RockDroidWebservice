class StructuresController < ApplicationController
  before_action :verify_auth_header
  before_action :set_structure, only: [:show, :edit, :update, :destroy]

  before_action :underscore_params!

  skip_before_filter :verify_authenticity_token

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
    if params[:outcrop_id]
      @structures = Structure.where(outcrop_id: params[:outcrop_id])
                        .paginate(page: params[:page], per_page: params[:size])
                        .order(created_at: :desc).all
      render json: @structures
    else
      @structures = Structure.paginate(page: params[:page], per_page: params[:size])
                        .order(created_at: :desc).all
      render json: @structures
    end
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

      if @structure.save
        render json: @structure, status: :created, location: @structure
      else
        render json: @structure.errors, status: :unprocessable_entity
      end

  end

  # PATCH/PUT /structures/1
  # PATCH/PUT /structures/1.json
  def update

      if @structure.update(structure_params)
        render json: @structure, status: :ok
      else
        render json: @structure.errors, status: :unprocessable_entity
      end

  end

  # DELETE /structures/1
  # DELETE /structures/1.json
  def destroy
    @structure.destroy
    render json: {message: 'Estrutura Excluida'} , status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_structure
      @structure = Structure.find(params[:uuid])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def structure_params
      params.permit(:uuid, :description, :dip, :dip_direction, :name, :phase, :structure_type, :outcrop_id,:deleted_at)
    end
end

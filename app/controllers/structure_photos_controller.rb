class StructurePhotosController < ApplicationController
  before_action :set_structure_photo, only: [:show, :edit, :update, :destroy]

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

  # GET /structure_photos
  # GET /structure_photos.json
  def index
    @structure_photos = StructurePhoto.paginate(page: params[:page], per_page: params[:size])
    .order(created_at: :desc).all
    render json: @structure_photos
  end

  def list
    @structure_photos = StructurePhoto.where(structure_id: params[:id])
    .paginate(page: params[:page], per_page: params[:size])
    .order(created_at: :desc).all
    render json: @structure_photos
  end

  # GET /structure_photos/1
  # GET /structure_photos/1.json
  def show
    render json: @structure_photo
  end

  # GET /structure_photos/new
  def new
    @structure_photo = StructurePhoto.new
  end

  # GET /structure_photos/1/edit
  def edit
  end

  # POST /structure_photos
  # POST /structure_photos.json
  def create
     @structure_photo = StructurePhoto.new(structure_photo_params)

      if @structure_photo.save
        render json: @structure_photo, status: :created
      else
        render json: @structure_photo.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /structure_photos/1
  # PATCH/PUT /structure_photos/1.json
  def update

      if @structure_photo.update(structure_photo_params)
        render json: @structure_photo, status: :ok
      else
        render json: @structure_photo.errors, status: :unprocessable_entity
      end
  end

  # DELETE /structure_photos/1
  # DELETE /structure_photos/1.json
  def destroy
    @structure_photo.destroy
    render json: {message: 'Foto Excluida'} , status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_structure_photo
      if params[:uuid].nil?
        params[:uuid] = params[:id]
      end
      @structure_photo = StructurePhoto.find(params[:uuid])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def structure_photo_params
      params.permit(:uuid, :base64image, :filename,:deleted_at,:structure_id)
    end
end

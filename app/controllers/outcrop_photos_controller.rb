class OutcropPhotosController < ApplicationController
  before_action :set_outcrop_photo, only: [:show, :edit, :update, :destroy]

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

  # GET /outcrop_photos
  # GET /outcrop_photos.json
  def index
    @outcrop_photos = OutcropPhoto.paginate(page: params[:page], per_page: params[:size]).all
    render json: @outcrop_photos
  end

  # GET /outcrop_photos/1
  # GET /outcrop_photos/1.json
  def show
    render json: @outcrop_photo
  end

  # GET /outcrop_photos/new
  def new
    @outcrop_photo = OutcropPhoto.new
  end

  # GET /outcrop_photos/1/edit
  def edit
  end

  # POST /outcrop_photos
  # POST /outcrop_photos.json
  def create
    @outcrop_photo = OutcropPhoto.new(outcrop_photo_params)

      if @outcrop_photo.save
          render json: @outcrop_photo, status: :created
      else
          render json: @outcrop_photo.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /outcrop_photos/1
  # PATCH/PUT /outcrop_photos/1.json
  def update
      if @outcrop_photo.update(outcrop_photo_params)
        render json: @outcrop_photo , status: :ok
      else
        render json: @outcrop_photo.errors, status: :unprocessable_entity
      end
  end

  # DELETE /outcrop_photos/1
  # DELETE /outcrop_photos/1.json
  def destroy
    @outcrop_photo.destroy
    render json: {message: 'Foto Excluida'} , status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outcrop_photo
      if params[:uuid].nil?
        params[:uuid] = params[:id]
      end
      @outcrop_photo = OutcropPhoto.find(params[:uuid])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def outcrop_photo_params
      params.require(:outcrop_photo).permit(:uuid, :base64image, :filename, :outcrop_id,:deleted_at)
    end
end

class SamplePhotosController < ApplicationController
  before_action :set_sample_photo, only: [:show, :edit, :update, :destroy]

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

  # GET /sample_photos
  # GET /sample_photos.json
  def index
    @sample_photos = SamplePhoto.paginate(page: params[:page], per_page: params[:size]).all
    render json: @sample_photos
  end

  # GET /sample_photos/1
  # GET /sample_photos/1.json
  def show
    render json: @sample_photo
  end

  # GET /sample_photos/new
  def new
    @sample_photo = SamplePhoto.new
  end

  # GET /sample_photos/1/edit
  def edit
  end

  # POST /sample_photos
  # POST /sample_photos.json
  def create
    @sample_photo = SamplePhoto.new(sample_photo_params)


      if @sample_photo.save
        render json: @sample_photo, status: :created
      else
        render json: @sample_photo.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /sample_photos/1
  # PATCH/PUT /sample_photos/1.json
  def update
      if @sample_photo.update(sample_photo_params)
        render json: @sample_photo, status: :ok
      else
        render json: @sample_photo.errors, status: :unprocessable_entity
      end
  end

  # DELETE /sample_photos/1
  # DELETE /sample_photos/1.json
  def destroy
    @sample_photo.destroy
    render json: {message: 'Foto Excluida'} , status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sample_photo
      if params[:uuid].nil?
        params[:uuid] = params[:id]
      end
      @sample_photo = SamplePhoto.find(params[:uuid])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sample_photo_params
      params.permit(:uuid, :base64image, :filename, :sample_id,:deleted_at)
    end
end

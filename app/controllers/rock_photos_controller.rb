class RockPhotosController < ApplicationController
  before_action :set_rock_photo, only: [:show, :edit, :update, :destroy]

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

  # GET /rock_photos
  # GET /rock_photos.json
  def index
    @rock_photos = RockPhoto.paginate(page: params[:page], per_page: params[:size]).all
    render json: @rock_photos
  end

  # GET /rock_photos/1
  # GET /rock_photos/1.json
  def show
    render json: @rock_photo
  end

  # GET /rock_photos/new
  def new
    @rock_photo = RockPhoto.new
  end

  # GET /rock_photos/1/edit
  def edit
  end

  # POST /rock_photos
  # POST /rock_photos.json
  def create
    @rock_photo = RockPhoto.new(rock_photo_params)

    respond_to do |format|
      if @rock_photo.save
        format.json { render :show, status: :created, location: @rock_photo }
      else
        format.json { render json: @rock_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rock_photos/1
  # PATCH/PUT /rock_photos/1.json
  def update
    respond_to do |format|
      if @rock_photo.update(rock_photo_params)
        format.json { render :show, status: :ok, location: @rock_photo }
      else
        format.json { render json: @rock_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rock_photos/1
  # DELETE /rock_photos/1.json
  def destroy
    @rock_photo.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rock_photo
      @rock_photo = RockPhoto.find(params[:uuid])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rock_photo_params
      params.require(:rock_photo).permit(:uuid, :base64image, :filename, :rock_uuid)
    end
end

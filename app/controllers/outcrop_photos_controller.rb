class OutcropPhotosController < ApplicationController
  before_action :set_outcrop_photo, only: [:show, :edit, :update, :destroy]

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

    respond_to do |format|
      if @outcrop_photo.save
        format.json { render :show, status: :created, location: @outcrop_photo }
      else
        format.json { render json: @outcrop_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /outcrop_photos/1
  # PATCH/PUT /outcrop_photos/1.json
  def update
    respond_to do |format|
      if @outcrop_photo.update(outcrop_photo_params)
        format.json { render :show, status: :ok, location: @outcrop_photo }
      else
        format.json { render json: @outcrop_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outcrop_photos/1
  # DELETE /outcrop_photos/1.json
  def destroy
    @outcrop_photo.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outcrop_photo
      @outcrop_photo = OutcropPhoto.find(params[:uuid])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def outcrop_photo_params
      params.require(:outcrop_photo).permit(:uuid, :base64image, :filename, :outcrop_uuid)
    end
end

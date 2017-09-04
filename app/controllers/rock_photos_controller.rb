class RockPhotosController < ApplicationController
  before_action :set_rock_photo, only: [:show, :edit, :update, :destroy]

  # GET /rock_photos
  # GET /rock_photos.json
  def index
    @rock_photos = RockPhoto.all
  end

  # GET /rock_photos/1
  # GET /rock_photos/1.json
  def show
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
        format.html { redirect_to @rock_photo, notice: 'Rock photo was successfully created.' }
        format.json { render :show, status: :created, location: @rock_photo }
      else
        format.html { render :new }
        format.json { render json: @rock_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rock_photos/1
  # PATCH/PUT /rock_photos/1.json
  def update
    respond_to do |format|
      if @rock_photo.update(rock_photo_params)
        format.html { redirect_to @rock_photo, notice: 'Rock photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @rock_photo }
      else
        format.html { render :edit }
        format.json { render json: @rock_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rock_photos/1
  # DELETE /rock_photos/1.json
  def destroy
    @rock_photo.destroy
    respond_to do |format|
      format.html { redirect_to rock_photos_url, notice: 'Rock photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rock_photo
      @rock_photo = RockPhoto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rock_photo_params
      params.require(:rock_photo).permit(:uuid, :base64image, :filename, :rock_uuid)
    end
end

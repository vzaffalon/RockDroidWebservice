class StructurePhotosController < ApplicationController
  before_action :set_structure_photo, only: [:show, :edit, :update, :destroy]

  # GET /structure_photos
  # GET /structure_photos.json
  def index
    @structure_photos = StructurePhoto.paginate(page: params[:page], per_page: params[:size]).all
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

    respond_to do |format|
      if @structure_photo.save
        format.html { redirect_to @structure_photo, notice: 'Structure photo was successfully created.' }
        format.json { render :show, status: :created, location: @structure_photo }
      else
        format.html { render :new }
        format.json { render json: @structure_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /structure_photos/1
  # PATCH/PUT /structure_photos/1.json
  def update
    respond_to do |format|
      if @structure_photo.update(structure_photo_params)
        format.html { redirect_to @structure_photo, notice: 'Structure photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @structure_photo }
      else
        format.html { render :edit }
        format.json { render json: @structure_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /structure_photos/1
  # DELETE /structure_photos/1.json
  def destroy
    @structure_photo.destroy
    respond_to do |format|
      format.html { redirect_to structure_photos_url, notice: 'Structure photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_structure_photo
      @structure_photo = StructurePhoto.find(params[:uuid])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def structure_photo_params
      params.require(:structure_photo).permit(:uuid, :base64image, :filename)
    end
end

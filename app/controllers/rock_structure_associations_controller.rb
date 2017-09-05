class RockStructureAssociationsController < ApplicationController
  before_action :set_rock_structure_association, only: [:show, :edit, :update, :destroy]

  # GET /rock_structure_associations
  # GET /rock_structure_associations.json
  def index
    @rock_structure_associations = RockStructureAssociation.paginate(page: params[:page], per_page: params[:size]).all
    render json: @rock_structure_associations
  end

  # GET /rock_structure_associations/1
  # GET /rock_structure_associations/1.json
  def show
    render json: @rock_structure_association
  end

  # GET /rock_structure_associations/new
  def new
    @rock_structure_association = RockStructureAssociation.new
  end

  # GET /rock_structure_associations/1/edit
  def edit
  end

  # POST /rock_structure_associations
  # POST /rock_structure_associations.json
  def create
    @rock_structure_association = RockStructureAssociation.new(rock_structure_association_params)

    respond_to do |format|
      if @rock_structure_association.save
        format.html { redirect_to @rock_structure_association, notice: 'Rock structure association was successfully created.' }
        format.json { render :show, status: :created, location: @rock_structure_association }
      else
        format.html { render :new }
        format.json { render json: @rock_structure_association.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rock_structure_associations/1
  # PATCH/PUT /rock_structure_associations/1.json
  def update
    respond_to do |format|
      if @rock_structure_association.update(rock_structure_association_params)
        format.html { redirect_to @rock_structure_association, notice: 'Rock structure association was successfully updated.' }
        format.json { render :show, status: :ok, location: @rock_structure_association }
      else
        format.html { render :edit }
        format.json { render json: @rock_structure_association.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rock_structure_associations/1
  # DELETE /rock_structure_associations/1.json
  def destroy
    @rock_structure_association.destroy
    respond_to do |format|
      format.html { redirect_to rock_structure_associations_url, notice: 'Rock structure association was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rock_structure_association
      @rock_structure_association = RockStructureAssociation.find(params[:uuid])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rock_structure_association_params
      params.require(:rock_structure_association).permit(:uuid, :structure_uuid, :rock_uuid, :outcrop_uuid)
    end
end

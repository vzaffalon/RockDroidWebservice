class RockStructureAssociationsController < ApplicationController
  before_action :set_rock_structure_association, only: [:show, :edit, :update, :destroy]

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
        format.json { render :show, status: :created, location: @rock_structure_association }
      else
        format.json { render json: @rock_structure_association.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rock_structure_associations/1
  # PATCH/PUT /rock_structure_associations/1.json
  def update
    respond_to do |format|
      if @rock_structure_association.update(rock_structure_association_params)
        format.json { render :show, status: :ok, location: @rock_structure_association }
      else
        format.json { render json: @rock_structure_association.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rock_structure_associations/1
  # DELETE /rock_structure_associations/1.json
  def destroy
    @rock_structure_association.destroy
    respond_to do |format|
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
class RockStructureAssociationsController < ApplicationController
  before_action :verify_auth_header
  before_action :set_rock_structure_association, only: [:show, :edit, :update, :destroy]

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

  # GET /rock_structure_associations
  # GET /rock_structure_associations.json
  def index
    @rock_structure_associations = RockStructureAssociation.paginate(page: params[:page], per_page: params[:size])
    .order(created_at: :desc).all
    render json: @rock_structure_associations
  end

  def find_rock_structure_associations
    @rock_structure_associations = Structure.joins("INNER JOIN rock_structure_associations ON structures.uuid = rock_structure_associations.structure_id where rock_structure_associations.rock_id = '#{params[:rock_id]}' and rock_structure_associations.outcrop_id = '#{params[:outcrop_id]}'")
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

      if @rock_structure_association.save
        render json:@rock_structure_association, status: :created
      else
        render json: @rock_structure_association.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /rock_structure_associations/1
  # PATCH/PUT /rock_structure_associations/1.json
  def update
      if @rock_structure_association.update(rock_structure_association_params)
        render json: @rock_structure_association, status: :ok, location: @rock_structure_association
      else
        render json: @rock_structure_association.errors, status: :unprocessable_entity
      end
  end

  def delete_rock_structure_association_by_rock
    @rock_structure_association = RockStructureAssociation.where("rock_structure_associations.rock_id = '#{params[:rock_id]}' and rock_structure_associations.structure_id = '#{params[:structure_id]}' and rock_structure_associations.outcrop_id = '#{params[:outcrop_id]}'").take
    if @rock_structure_association.destroy
      render json: {message: 'Associação Excluida'} , status: :ok
    else
      render json: @rock_structure_association.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rock_structure_associations/1
  # DELETE /rock_structure_associations/1.json
  def destroy
    @rock_structure_association.destroy
    render json: {message: 'Associação Excluida'} , status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rock_structure_association
      @rock_structure_association = RockStructureAssociation.find(params[:uuid])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rock_structure_association_params
      params.permit(:uuid, :structure_id, :rock_id, :outcrop_id,:deleted_at)
    end
end

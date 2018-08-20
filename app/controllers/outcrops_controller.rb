class OutcropsController < ApplicationController
  before_action :verify_auth_header
  before_action :set_outcrop, only: [:show, :edit, :update, :destroy]

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

  # GET /outcrops
  # GET /outcrops.json
  def index
    if params[:stage_id]
      @outcrops = Outcrop.where(stage_id: params[:stage_id])
                      .paginate(page: params[:page], per_page: params[:size])
                      .order(created_at: :desc)
                      .all
      render json: @outcrops

    else
      @outcrops = Outcrop.
          paginate(page: params[:page], per_page: params[:size])
                      .order(created_at: :desc)
                      .all
      render json: @outcrops
    end

  end

  def user_outcrops
    @outcrops = []
    if params[:user_id]
      @projects = Project.where(user_id: params[:user_id])
      for project in @projects
        @stages = project.stages
        for stage in @stages
          for outcrop in stage.outcrops
            @outcrops.push(outcrop)
          end
        end
      end
      render json: @outcrops
    else
      @outcrops = Outcrop.all
      render json: @outcrops
    end

  end

  # GET /outcrops/1
  # GET /outcrops/1.json
  def show
    render json: @outcrop
  end

  # GET /outcrops/new
  def new
    @outcrop = Outcrop.new
  end

  # GET /outcrops/1/edit
  def edit
  end

  # POST /outcrops
  # POST /outcrops.json
  def create
    @outcrop = Outcrop.new(outcrop_params)

    if @outcrop.save
      render json: @outcrop, status: :created
    else
      render json: @outcrop.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /outcrops/1
  # PATCH/PUT /outcrops/1.json
  def update
    if params[:updated_at].present?
      return render json: @outcrop, status: :ok if params[:updated_at].to_datetime < @outcrop.updated_at
    end

    if @outcrop.update(outcrop_params)
      render json: @outcrop, status: :ok
    else
      render json: @outcrop.errors, status: :unprocessable_entity
    end
  end

  # DELETE /outcrops/1
  # DELETE /outcrops/1.json
  def destroy
    if @outcrop.destroy
      render json: {message: 'Afloramento Excluido'}, status: :ok
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_outcrop
    @outcrop = Outcrop.find(params[:uuid])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def outcrop_params
    params.permit(:uuid, :altitude, :dateTime, :description, :latitude, :longitude, :name, :toponomy, :stage_id, :deleted_at, :updated_at)
  end
end

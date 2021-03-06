class StagesController < ApplicationController
  before_action :verify_auth_header
  before_action :set_stage, only: [:show, :edit, :update, :destroy]

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

  # GET /stages
  # GET /stages.json
  def index
    if params[:project_id]
      @stages = Stage.where(project_id: params[:project_id])
                    .paginate(page: params[:page], per_page: params[:size])
                    .order(created_at: :desc).all
      render json: @stages
    else
      @stages = Stage.paginate(page: params[:page], per_page: params[:size])
                    .order(created_at: :desc).all
      render json: @stages
    end
  end

  # GET /stages/1
  # GET /stages/1.json
  def show
    render json: @stage
  end

  # GET /stages/new
  def new
    @stage = Stage.new
  end

  # GET /stages/1/edit
  def edit
  end

  # POST /stages
  # POST /stages.json
  def create
    @stage = Stage.new(stage_params)

    if @stage.save
      render json: @stage, status: :created
    else
      render json: @stage.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stages/1
  # PATCH/PUT /stages/1.json
  def update
    if params[:updated_at].present?
      return render json: @stage, status: :ok if params[:updated_at].to_datetime < @stage.updated_at
    end

    if @stage.update(stage_params)
      render json: @stage, status: :ok
    else
      render json: @stage.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stages/1
  # DELETE /stages/1.json
  def destroy
    @stage.destroy
    render json: {message: 'Etapa Excluida'}, status: :ok
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_stage
    @stage = Stage.find(params[:uuid])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def stage_params
    params.permit(:uuid, :city, :initialDate, :initial_date, :name, :uf, :project_id, :deleted_at, :updated_at)
  end
end

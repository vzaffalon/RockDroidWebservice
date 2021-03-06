class SamplesController < ApplicationController
  before_action :verify_auth_header
  before_action :set_sample, only: [:show, :edit, :update, :destroy]

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

  # GET /samples
  # GET /samples.json
  def index
    if params[:outcrop_id]
      @samples = Sample.where(outcrop_id: params[:outcrop_id])
                     .paginate(page: params[:page], per_page: params[:size])
                     .order(created_at: :desc).all
      render json: @samples
    else
      @samples = Sample.paginate(page: params[:page], per_page: params[:size])
                     .order(created_at: :desc).all
      render json: @samples
    end
  end

  # GET /samples/1
  # GET /samples/1.json
  def show
    render json: @sample
  end

  # GET /samples/new
  def new
    @sample = Sample.new
  end

  # GET /samples/1/edit
  def edit
  end

  # POST /samples
  # POST /samples.json
  def create
    @sample = Sample.new(sample_params)

    if @sample.save
      render json: @sample, status: :created
    else
      render json: @sample.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /samples/1
  # PATCH/PUT /samples/1.json
  def update
    if params[:updated_at].present?
      return render json: @sample, status: :ok if params[:updated_at].to_datetime < @sample.updated_at
    end

    if @sample.update(sample_params)
      render json: @sample, status: :ok
    else
      render json: @sample.errors, status: :unprocessable_entity
    end
  end

  # DELETE /samples/1
  # DELETE /samples/1.json
  def destroy
    @sample.destroy
    render json: {message: 'Amostra Excluida'}, status: :ok
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_sample
    @sample = Sample.find(params[:uuid])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def sample_params
    params.permit(:uuid, :name, :outcrop_id, :deleted_at, :updated_at)
  end
end

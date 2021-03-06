class RocksController < ApplicationController
  before_action :verify_auth_header
  before_action :set_rock, only: [:show, :edit, :update, :destroy]

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

  # GET /rocks
  # GET /rocks.json
  def index
    if params[:outcrop_id]
      @rocks = Rock.where(outcrop_id: params[:outcrop_id])
                   .paginate(page: params[:page], per_page: params[:size])
                   .order(created_at: :desc).all
      render json: @rocks
    else
      @rocks = Rock.paginate(page: params[:page], per_page: params[:size])
                   .order(created_at: :desc).all
      render json: @rocks
    end
  end

  def list
    @rocks = Rock.paginate(page: params[:page], per_page: params[:size])
                 .order(created_at: :desc).all
    render json: @rocks
  end

  # GET /rocks/1
  # GET /rocks/1.json
  def show
    render json: @rock
  end

  # GET /rocks/new
  def new
    @rock = Rock.new
  end

  # GET /rocks/1/edit
  def edit
  end

  # POST /rocks
  # POST /rocks.json
  def create
    @rock = Rock.new(rock_params)

    if @rock.save
      render json: @rock, status: :created
    else
      render json: @rock.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rocks/1
  # PATCH/PUT /rocks/1.json
  def update
    if params[:updated_at].present?
      return render json: @rock, status: :ok if params[:updated_at].to_datetime < @rock.updated_at
    end

    if @rock.update(rock_params)
      render json: @rock, status: :ok
    else
      render json: @rock.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rocks/1
  # DELETE /rocks/1.json
  def destroy
    @rock.destroy
    render json: {message: 'Pedra Excluida'}, status: :ok
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_rock
    @rock = Rock.find(params[:uuid])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def rock_params
    params.permit(:uuid, :composition, :degree, :mineralogy, :name, :nomenclature, :size, :texture, :trama, :rock_type, :outcrop_id, :deleted_at, :updated_at)
  end
end

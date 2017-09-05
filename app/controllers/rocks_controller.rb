class RocksController < ApplicationController
  before_action :set_rock, only: [:show, :edit, :update, :destroy]

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

  # GET /rocks
  # GET /rocks.json
  def index
    @rocks = Rock.paginate(page: params[:page], per_page: params[:size]).all
  end

  # GET /rocks/1
  # GET /rocks/1.json
  def show
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

    respond_to do |format|
      if @rock.save
        format.json { render :show, status: :created, location: @rock }
      else
        format.json { render json: @rock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rocks/1
  # PATCH/PUT /rocks/1.json
  def update
    respond_to do |format|
      if @rock.update(rock_params)
        format.json { render :show, status: :ok, location: @rock }
      else
        format.json { render json: @rock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rocks/1
  # DELETE /rocks/1.json
  def destroy
    @rock.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rock
      @rock = Rock.find(params[:uuid])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rock_params
      params.require(:rock).permit(:uuid, :composition, :degree, :mineralogy, :name, :nomenclature, :size, :texture, :trama, :type, :outcrop_uuid)
    end
end

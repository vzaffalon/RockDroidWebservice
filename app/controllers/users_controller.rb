class UsersController < ApplicationController
  protect_from_forgery
  before_action :set_user, only: [:edit, :update, :destroy]

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

  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(page: params[:page], per_page: params[:size])
    .order(created_at: :desc).all
    render json: @users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.where('email = ?',params[:email]).take
    render json: @user
  end

  def show_by_id
    @user = User.where('uuid = ?',params[:id]).take
    render json: @user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    aux = user_params
    @aux_user = User.where('email = ?',aux[:email]).take
    if @aux_user
      render json: {error: 'usuario ja existe'}, status: :unprocessable_entity
    else
      @user = User.new(user_params)
      # @user.password_hash = params[:password_hash]
      @user.password = params[:password]
      if @user.save
        render json: @user, status: 200
      else
          render json: @user.errors, status: :unprocessable_entity
      end
    end
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      render json: @user, status: :ok
    else
      render json: {error: 'Email ou senha incorretos'} , status: :unauthorized
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
      if @user.update(user_params)
        render json: @user, status: :ok, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    render json: {message: 'Usuario Excluido'} , status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:uuid])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.permit(:uuid, :email, :name, :deleted_at,:is_teacher,:user_image)
    end
end

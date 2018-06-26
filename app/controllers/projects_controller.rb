class ProjectsController < ApplicationController
  before_action :verify_auth_header
  before_action :set_project, only: [:show, :edit, :update, :destroy]

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

  # GET /projects
  # GET /projects.json
  def index
    if @user.is_teacher
      @users = []
      @projects = Project.paginate(page: params[:page], per_page: params[:size])
                      .order(created_at: :desc).all
      for @project in @projects
        @user = User.where(uuid: @project.user_id).take
        @users.push(@user)
      end
      @response = {}
      @response['projects'] = @projects
      @response['users'] = @users
      render json: @response
    else
      @projects = Project.where(user_id: @user.uuid).paginate(page: params[:page], per_page: params[:size])
                      .order(created_at: :desc)
                      .all

      @response = {}
      @response['projects'] = @projects
      render json: @response
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    render json: @project
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

      if @project.save
          render json: @project, status: :created
      else
          render json: @project.errors, status: :unprocessable_entity
      end
  end


  def get_all_project_data

    @response = {}
    @projects = []
    @stages = []
    @outcrops = []
    @rocks = []
    @structures = []
    @samples = []

    @project = Project.find(params[:uuid])
    @projects.push(@project)
    for @stage in @project.stages
      @stages.push(@stage)
      for @outcrop in @stage.outcrops
        @outcrops.push(@outcrop)
        for @rock in @outcrop.rocks
            @rocks.push(@rock)
        end
        for @sample in @outcrop.samples
            @samples.push(@sample)
        end
        for @structure in @outcrop.structures
          @structures.push(@structure)
        end
      end


    end

    @response['projects'] = @projects
    @response['stages'] = @stages
    @response['outcrops'] = @outcrops
    @response['rocks'] = @rocks
    @response['structures'] = @structures
    @response['samples'] = @samples
    render json: @response, status: :ok
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update

      if @project.update(project_params)
        render json: @project, status: :ok
      else
        render json: @project.errors, status: :unprocessable_entity
      end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    render json: {message: 'Projeto Excluido'} , status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      puts params[:uuid]
      @project = Project.find(params[:uuid])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.permit(:uuid, :name,:user_id, :deleted_at, :creation_date)
    end
end

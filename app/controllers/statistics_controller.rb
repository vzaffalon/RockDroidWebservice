class StatisticsController < ApplicationController
  before_action :verify_auth_header
  def statistics
    number_of_projects = Project.where(user_id: @user.uuid).all
    number_of_stages = Stage.where(project_id: @project_id).all
  end
end
  
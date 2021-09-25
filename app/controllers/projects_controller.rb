class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @project = Project.all
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path
    else
      render "index"
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
  end

  def project_params
    params.require(:project).permit[:name, :location, :description]
  end
end

class ProjectsController < ApplicationController
  before_filter :authenticate_user!

  # GET /projects
  # GET /projects.json
  def index
    @projects = current_user.projects

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = current_user.projects.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

end

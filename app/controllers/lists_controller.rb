class ListsController < ApplicationController
  before_filter :authenticate_user!


  # GET /lists
  # GET /lists.json
  def index
    @lists = current_project.lists

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lists }
    end
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    @list = current_project.lists.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @list }
    end
  end

private 
  def current_project 
    current_user.projects.find(params[:project_id])
  end 
end

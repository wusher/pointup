class TodosController < ApplicationController
  before_filter :authenticate_user!

  # GET /todos
  # GET /todos.json
  def index
    @todos = current_list.todos

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @todos }
    end
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
    @todo = current_list.todos.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @todo }
    end
  end
  # GET /todos/1/edit
  def edit
    @todo = current_list.todos.find(params[:id])
  end

  # PUT /todos/1
  # PUT /todos/1.json
  def update
    @todo = current_list.todos.find(params[:id])

    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

private 
  
  def current_list
    current_user.projects.find(params[:project_id]).lists.find(params[:list_id])
  end 

end

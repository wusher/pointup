class UsersController < ApplicationController
  before_filter :authenticate_admin!
  def waiting
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  #PUT /users/1/authorize 
  def authorize
    @user = User.find(params[:id])
    @user.authorized = true 

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url }
        format.json { head :ok }
      else 
        format.html { render action: "index" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end 
    end
  end 

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
end

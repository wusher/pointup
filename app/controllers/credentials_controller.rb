class CredentialsController < ApplicationController

  before_filter :authenticate_session!


  # GET /credentials
  def edit
    @user = current_user 
  end

  # PUT /credentials
  def update
    @user = current_user

    token = params[:credentials][:basecamp_token] 
    if !token.blank?
      @user.basecamp_token = params[:credentials][:basecamp_token]
      @user.basecamp_login = nil
      @user.basecamp_password = nil
    else 
      @user.basecamp_token = nil
      @user.basecamp_login =  params[:credentials][:basecamp_login]
      @user.basecamp_password = params[:credentials][:basecamp_password]
    end 


    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to credentials_path, notice: 'Credentials was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @credential.errors, status: :unprocessable_entity }
      end
    end
  end
end

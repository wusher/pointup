class SettingsController < ApplicationController
  before_filter :authenticate_admin! 

  # GET /settings/1/edit
  def edit
    @setting = Settings.first || Settings.create!
  end

  # PUT /settings/1
  # PUT /settings/1.json
  def update
    @setting = Settings.first  || Settings.create!

    respond_to do |format|
      if @setting.update_attributes(params[:setting])
        format.html { redirect_to settings_path, notice: 'Setting was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

end

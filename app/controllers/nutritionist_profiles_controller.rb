class NutritionistProfilesController < ApplicationController
  
  def index

  end

  def edit
    @nutriProfile = NutritionistProfile.find(params[:id])
  end

  def show
    @nutriProfile = NutritionistProfile.find(params[:id])
  end

  def create
    @nutriProfile = NutritionistProfile.new(nutriprofile_params)
    save_nutriprofile
  end

  def new
    @nutriProfile = NutritionistProfile.new
  end

  def destroy
    @nutriProfile = NutritionistProfile.find(params[:id]).destroy
    redirect_to nutritionist_profiles_path
  end

  private

  def nutriprofile_params
    params.require(:nutri_profile).permit(:name, :email, :issuing_institution, :crn_number, :crn_expiration, :license_type)
  end
  
  def save_nutriprofile
    if @nutriProfile.save
      redirect_to @nutriProfile
    else
      render "new"
    end
  end
  def update_nutriprofile
    if @nutriProfile.update(nutriprofile_params)
      redirect_to @nutriProfile
    else
      render "edit"
    end
  end

end

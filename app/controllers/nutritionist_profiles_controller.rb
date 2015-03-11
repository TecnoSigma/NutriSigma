class NutritionistProfilesController < ApplicationController
  before_action :set_nutri_profile, only: [:edit, :update, :show, :destroy]
  def index
  end

  def edit
  end

  def update
    update_nutriprofile
  end

  def show
  end

  def create
    @nutri_profile = NutritionistProfile.new(nutriprofile_params)
    save_nutriprofile
  end

  def new
    @nutri_profile = NutritionistProfile.new
  end

  def destroy
    @nutri_profile.destroy
    redirect_to nutritionist_profiles_path
  end

  private

  def set_nutri_profile
    @nutri_profile = NutritionistProfile.find(params[:id])
  end

  def nutriprofile_params
    params.require(:nutri_profile).permit(:name, :email, :issuing_institution, :crn_number, :crn_expiration, :license_type)
  end

  def save_nutriprofile
    if @nutri_profile.save
      redirect_to @nutri_profile
    else
      render "new"
    end
  end
  def update_nutriprofile
    if @nutri_profile.update(nutriprofile_params)
      redirect_to @nutri_profile
    else
      render "edit"
    end
  end
end

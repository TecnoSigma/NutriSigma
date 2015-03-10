class NutritionistProfilesController < ApplicationController
  
  def index

  end

  def edit
    @nutriProfile = NutritionistProfile.find(params[:id])
  end

  def nutriprofile_params
    params.require(:nutriprofile).permit(:name, :email, :issuing_institution, :crn_number, :crn_expiration, :license_type)
  end

end

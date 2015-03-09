class NutritionistProfile < ActiveRecord::Base
  validates_presence_of :name, :email, :issuing_institution, :crn_number, :crn_expiration, :license_type
end

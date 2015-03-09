class NutritionistProfile < ActiveRecord::Base
  validates_presence_of :name, :email, :issuing_institution, :crn_number, :expiration_crn, :license_type
end

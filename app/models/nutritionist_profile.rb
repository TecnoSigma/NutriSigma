class NutritionistProfile < ActiveRecord::Base
  validates_presence_of :name, :email, :issuing_institution, :crn_number, :crn_expiration, :license_type
  validates :license_type, inclusion: { in: %w(Definitiva Provisória)}
end

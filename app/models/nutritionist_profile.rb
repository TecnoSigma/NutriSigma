class NutritionistProfile < ActiveRecord::Base
  validates_presence_of :name, :email, :issuing_institution, :crn_number, :crn_expiration, :license_type
  validates :license_type, inclusion: { in: %w(Definitiva Provisória)}
  validates :issuing_institution, inclusion: { in: %w(CRN-1 CRN-2 CRN-3 CRN-4 CRN-5 CRN-6 CRN-7 CRN-8 CRN-9 CRN-10)}
  belongs_to :nutritionist
end

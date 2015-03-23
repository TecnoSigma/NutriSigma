class Nutritionist < ActiveRecord::Base
  has_many :patients
  has_one :nutritionist_profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def has_profile?
    !nutritionist_profile.nil?
  end
end

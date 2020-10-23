class Appointment < ApplicationRecord
	belongs_to :doctor
	belongs_to :patient
#	belongs_to :city    pas pris en compte 
end

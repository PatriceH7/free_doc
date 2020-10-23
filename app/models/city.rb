class City < ApplicationRecord
#	has_many :patients  patients et appointments pas pris en compte durant migration
	has_many :doctors
#	has_many :appointments
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# nettoie la base de données des enregistrements précédents
Patient.destroy_all
Doctor.destroy_all
Appointment.destroy_all



4.times do |index|
City.create!(name: ["Paris", "Lille", "Lyon", "Versailles"].sample)
end
puts "4 villes créées."

50.times do |index|
Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end
puts "50 patients créés."

10.times do |index|
Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, specialty: ["Médecin généraliste", "Cardiologue", "ORL", "Psychologue"].sample, zip_code: ["75001", "59000", "69000", "78000"].sample, city_id: Faker::Number.between(from: City.first.id, to: City.last.id))
end
puts "10 docteurs créés."

100.times do |index|
Appointment.create!(date: Faker::Date.between(from: 60.days.ago, to: Date.today), doctor_id: Faker::Number.between(from: Doctor.first.id, to: Doctor.last.id), patient_id: Faker::Number.between(from: Patient.first.id, to: Patient.last.id))
end
puts "100 rendez-vous créés."





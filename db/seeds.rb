# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

City.destroy_all
Appointment.destroy_all
Doctor.destroy_all
Patient.destroy_all

10.times do
  City.create(name: Faker::Address.city)
end

10.times do
  Specialty.create(name: Faker::Games::Pokemon.name)
end

10.times do
  Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Address.city, city_id: City.all.sample.id, specialty: Specialty.all.sample.name)
end

10.times do
  Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: City.all.sample.id)
end

10.times do
  Appointment.create(date: Faker::Date.between(from: '2020-09-23', to: '2022-02-10'), doctor_id: Doctor.all.sample.id, patient_id: Patient.all.sample.id, city_id: City.all.sample.id)
end

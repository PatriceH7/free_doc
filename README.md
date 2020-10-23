# README free_doc

Se placer dans le dossier free_doc
Faire un bundle install


Les tests initiaux déployés pour valider la relation N-N à travers les Appointments sont les suivants:

2.7.1 :001 > doc1 = Doctor.create
2.7.1 :002 > pat1 = Patient.create
2.7.1 :003 > app1 = Appointment.create(doctor: doc1, patient: pat1)

2.7.1 :004 > app1.doctor
 => #<Doctor id: 1, first_name: nil, last_name: nil, specialty: nil, zip_code: nil, created_at: "2020-10-22 14:44:32", updated_at: "2020-10-22 14:44:32">

2.7.1 :005 > app1.patient
 => #<Patient id: 1, first_name: nil, last_name: nil, created_at: "2020-10-22 14:44:42", updated_at: "2020-10-22 14:44:42">

2.7.1 :006 > pat2 = Patient.create
2.7.1 :007 > app2 = Appointment.create(doctor: doc1, patient: pat2)

2.7.1 :008 > doc1.patients
=> #<ActiveRecord::Associations::CollectionProxy [#<Patient id: 1, first_name: nil, last_name: nil, created_at: "2020-10-22 14:44:42", updated_at: "2020-10-22 14:44:42">, #<Patient id: 2, first_name: nil, last_name: nil, created_at: "2020-10-22 14:46:30", updated_at: "2020-10-22 14:46:30">]>

2.7.1 :009 > doc2 = Doctor.create
2.7.1 :010 > app3 = Appointment.create(doctor: doc2, patient: pat2)

2.7.1 :011 > pat2.doctors
 => #<ActiveRecord::Associations::CollectionProxy [#<Doctor id: 1, first_name: nil, last_name: nil, specialty: nil, zip_code: nil, created_at: "2020-10-22 14:44:32", updated_at: "2020-10-22 14:44:32">, #<Doctor id: 2, first_name: nil, last_name: nil, specialty: nil, zip_code: nil, created_at: "2020-10-22 14:49:02", updated_at: "2020-10-22 14:49:02">]>

 2.7.1 :012 > pat1.doctors
  => #<ActiveRecord::Associations::CollectionProxy [#<Doctor id: 1, first_name: nil, last_name: nil, specialty: nil, zip_code: nil, created_at: "2020-10-22 14:44:32", updated_at: "2020-10-22 14:44:32">]>

  2.7.1 :013 > doc1.patients
   => #<ActiveRecord::Associations::CollectionProxy [#<Patient id: 1, first_name: nil, last_name: nil, created_at: "2020-10-22 14:44:42", updated_at: "2020-10-22 14:44:42">, #<Patient id: 2, first_name: nil, last_name: nil, created_at: "2020-10-22 14:46:30", updated_at: "2020-10-22 14:46:30">]>
    
  2.7.1 :014 > doc2.patients
   => #<ActiveRecord::Associations::CollectionProxy [#<Patient id: 2, first_name: nil, last_name: nil, created_at: "2020-10-22 14:46:30", updated_at: "2020-10-22 14:46:30">]>

  Ensuite, pour lancer avec le fichier seed.rb
  Lancer rails db:seed


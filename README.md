# README for free_doc

FreeDoc, 1er concurrent sérieux à Doctolib!
Version Ruby 2.7.1

On a défini initialement 3 models : Doctor, Patient, Appointment.

Un appointment ne peut avoir qu'un seul doctor, mais un doctor peut avoir plusieurs appointment.
Un appointment ne peut avoir qu'un seul patient, mais un patient peut avoir plusieurs appointment.
Un doctor peut avoir plusieurs patient, au travers des appointments, et vice versa.

Les relations en place sont donc du type:
1-N entre les doctor et les appointment
1-N entre les patient et les appointment
Ce qui conduit à une relation N-N entre les doctor et les patient, à travers les appointment.

Le business se développant rapidement, on est passé à l'étape suivante, avec la création d'un 4ème model City, sur la base de la relation suivante : chaque docteur, patient, et rendez-vous est lié à une city, et une city peut avoir plusieurs docteurs, patients, et rendez-vous.
Ce qui donne une relation 1-N entre les city et les doctor, patient et appointment.

On lancera seed avec la commande : rails db:seed



En étape initiale, j'ai indiqué ci-dessous les tests manuels et les résultats obtenus, qui confirment le bon fonctionnement des relations dans la version initiale (pré-city):


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


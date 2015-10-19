# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

role_admin = Role.find_or_create_by(name: 'admin', description: 'Administrator')

role_recept = Role.find_or_create_by(name: 'recept', description: 'Receptionist')
role_dr = Role.find_or_create_by(name: 'dr', description: 'Doctor')
role_cust = Role.find_or_create_by(name: 'cust', description: 'Customer')

user_owner = User.find_or_create_by(name: 'The Owner', years_in_practice: 1, email: 'admin@nowhere.com')
user_owner.roles << role_admin unless user_owner.roles.pluck(:name).include?('admin')
user_owner.roles << role_dr unless user_owner.roles.pluck(:name).include?('dr')

user_recpt = User.find_or_create_by(name: 'The Receptionist', email: 'recept@nowhere.com')
user_recpt.roles << role_recept unless user_recpt.roles.pluck(:name).include?('recept')

user_dr_1 = User.find_or_create_by(name: 'Dr Bob', years_in_practice: 1, email: 'dr1@nowhere.com')
user_dr_2 = User.find_or_create_by(name: 'Dr Susan', years_in_practice: 2, email: 'dr2@nowhere.com')
user_dr_1.roles << role_dr unless user_dr_1.roles.pluck(:name).include?('dr')
user_dr_2.roles << role_dr unless user_dr_2.roles.pluck(:name).include?('dr')

user_cust_1 = User.find_or_create_by(name: 'Customer 1', email: 'cust1@nowhere.com')
user_cust_2 = User.find_or_create_by(name: 'Customer 2', email: 'cust2@nowhere.com')
user_cust_1.roles << role_cust unless user_cust_1.roles.pluck(:name).include?('cust')
user_cust_2.roles << role_cust unless user_cust_2.roles.pluck(:name).include?('cust')

pet_fido = Pet.find_or_create_by(name: 'Fido', pet_type: 'dog', breed: 'beagle', age: 1, weight: 2)
user_cust_1.pets << pet_fido unless user_cust_1.pets.include?(pet_fido)

pet_boots = Pet.find_or_create_by(name: 'Boots', pet_type: 'cat', breed: 'cartoon', age: 3, weight: 4)
user_cust_2.pets << pet_boots unless user_cust_2.pets.include?(pet_boots)

pet_feather = Pet.find_or_create_by(name: 'Feather', pet_type: 'bird', breed: 'light', age: 5, weight: 6)
user_cust_2.pets << pet_feather unless user_cust_2.pets.include?(pet_feather)

# Obviously, if this was for a prod app, you'd handle seting passwords some other way...
[user_owner,user_recpt,user_dr_1,user_dr_2,user_cust_1,user_cust_2].each do |user|
  user.password = '12345678'
  user.save!
end

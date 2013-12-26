# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
brent = User.find_or_create_by_email(
  name: 'Brent',
  email: 'brent@yopmail.com',
  password: 'password',
  password_confirmation: 'password'
)
spencer = User.find_or_create_by_email(
  name: 'Spencer',
  email: 'spencer@yopmail.com',
  password: 'password',
  password_confirmation: 'password'
)

idiot_energy = Collaboration.find_or_create_by_name_and_user_id('Idiot Energy', brent.id)
writer_artist = Collaboration.find_or_create_by_name_and_user_id('A Writer and an Artist', brent.id)
puppies = Collaboration.find_or_create_by_name_and_user_id('Dharma Puppies', spencer.id)

Participation.find_or_create_by_collaboration_id_and_user_id(idiot_energy.id, spencer.id)
Participation.find_or_create_by_collaboration_id_and_user_id(puppies.id, brent.id)

Invitation.find_or_create_by_collaboration_id_and_user_id(writer_artist.id, spencer.id)

puts 'DEFAULT USERS'
puts 'user: Brent'
puts 'user: Spencer'
puts ''
puts 'DEFAULT COLLABORATIONS'
puts 'collaboration: Idiot Energy'
puts 'collaboration: A Writer and an Artist'
puts 'collaboration: Dharma Puppies'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
users = [
  User.find_or_create_by_email(
    name: 'Brent',
    email: 'brent@yopmail.com',
    password: 'password',
    password_confirmation: 'password'
  ),
  User.find_or_create_by_email(
    name: 'Pat',
    email: 'pat@yopmail.com',
    password: 'password',
    password_confirmation: 'password'
  )
]

collaborations = [
  Collaboration.find_or_create_by_name_and_user_id('Idiot Energy', users[0].id),
  Collaboration.find_or_create_by_name_and_user_id('A Writer and an Artist', users[0].id),
  Collaboration.find_or_create_by_name_and_user_id('Dharma Puppies', users[1].id)
]

Invitation.find_or_create_by_collaboration_id_and_user_id(collaborations[0].id, users[1].id)
Invitation.find_or_create_by_collaboration_id_and_user_id(collaborations[1].id, users[1].id)
Invitation.find_or_create_by_collaboration_id_and_user_id(collaborations[2].id, users[0].id)

Participation.find_or_create_by_collaboration_id_and_user_id(collaborations[0].id, users[1].id)
Participation.find_or_create_by_collaboration_id_and_user_id(collaborations[2].id, users[0].id)

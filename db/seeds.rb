# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or whered alongside the db with db:setup).
#
# Examples:
#
#   cities = City.where([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.where(name: 'Emanuel', city: cities.first)

Priority.where(name: 'Low').first_or_create
Priority.where(name: 'Medium').first_or_create
Priority.where(name: 'High').first_or_create

Status.where(name: 'New').first_or_create
Status.where(name: 'In progress').first_or_create
Status.where(name: 'Closed').first_or_create

User.find_or_create_by(email: 'user@example.com') do |u|
  u.password = 'dontknow'
  u.password_confirmation = 'dontknow'
end
User.find_or_create_by(email: 'user2@example.com') do |u|
  u.password = 'dontknow'
  u.password_confirmation = 'dontknow'
end

Role.where(name: 'owner').first_or_create
Role.where(name: 'contributor').first_or_create
Role.where(name: 'admin').first_or_create
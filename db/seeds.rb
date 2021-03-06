# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

List.destroy_all
Task.destroy_all

10.times do
  list = List.create!(name: Faker::Job.field)
  rand(1..4).times do
    list.tasks.create(description: Faker::Job.title)
  end
end

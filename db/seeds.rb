# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Create a super admin
User.create!(first_name: 'Rutani', last_name: 'Thakkar', phone: '1234567899', email: 'rutanithakkar@gmail.com', password: 'Rutani@123', role: 'super-admin')

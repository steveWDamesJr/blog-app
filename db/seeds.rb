# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Walker', photo: 'https://farm9.staticflickr.com/8665/16050225024_5f8d3d71dd_o.jpg', bio: 'Imperial Force')
second_user = User.create(name: 'Obiwan', photo: 'https://pm1.narvii.com/6448/c6346cf7c2d78b6d11469a82580aff45a9a0e296_hq.jpg', bio: 'Her Majesty Guard')
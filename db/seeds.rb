# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do 
  puts "Destroying tables..."
  # Unnecessary if using `rails db:seed:replant`
  User.destroy_all
  Bench.destroy_all

  puts "Resetting primary keys..."
  # For easy testing, so that after seeding, the first `User` has `id` of 1
  ApplicationRecord.connection.reset_pk_sequence!('users')

  puts "Creating users..."
  # Create one user with an easy to remember username, email, and password:
  User.create!(
    username: 'Demo-lition', 
    email: 'demo@user.io', 
    password: 'password'
  )

  # More users
  10.times do 
    User.create!({
      username: Faker::Internet.unique.username(specifier: 3),
      email: Faker::Internet.unique.email,
      password: 'password'
    }) 
  end

  Bench.create!({
    title: 'Soft Bench', 
    description: 'the softest of benches for a relaxing sit',
    price: 350,
    seating: 4,
    lat: 40.750071106958124,
    lng:-73.99486249212771
  })

  Bench.create!({
    title: 'Hard Bench', 
    description: 'the hardest of benches for a serious sit',
    price: 230,
    seating: 3,
    lat: 40.72386519582762, 
    lng: -74.00240610580231
  })

  Bench.create!({
    title: 'Big Bench', 
    description: 'the biggest of benches for a spread out breath easy sit sesh',
    price: 600,
    seating: 7,
    lat: 40.71769017761537, 
    lng: -73.98782667986737
  })

  Bench.create!({
    title: 'Cedar Bench', 
    description: 'fancy wood bench with fancy wood',
    price: 900,
    seating: 2,
    lat: 40.73656151805317, 
    lng: -73.98337604089762
  })

  Bench.create!({
    title: 'Amins Bench', 
    description: 'Exclusive bench for people Amin likes',
    price: 777,
    seating: 2,
    lat: 40.736223222056694,
    lng: -73.99388494329757
  })

  Bench.create!({
    title: 'Furry Bench', 
    description: 'this bench has an alpaca fur seat cushion so its super comfortable',
    price: 999,
    seating: 3,
    lat: 40.68654320483262, 
    lng: -74.02579557967344
  })
  puts "Done!"
end
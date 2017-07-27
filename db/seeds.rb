puts "----> Seeding started"

puts "----> Seeding users"
User.create(email: "admin@mail.com", password: "qwer1234", role: User::Status[:admin])
User.create(email: "client@mail.com", password: "qwer1234", role: User::Status[:client])

puts "----> Seeding vehicles"

50.times {
    Vehicle.create(plate: "#{['ABC','DFG'].sample}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}", color: Faker::Color.color_name, year: rand(1970..DateTime.now.year))
}

puts "----> Seeding passengers"
100.times {
    Passenger.create(name: Faker::Name.name, cellphone: Faker::PhoneNumber.cell_phone)
}

puts "----> Seeding routes"
1000.times {
    Route.create(start_point: Faker::Address.street_address, end_point: Faker::Address.street_address, vehicle_id: Vehicle.all.sample.id, passenger_id: Passenger.all.sample.id)
}

puts "----> Seeding finished"
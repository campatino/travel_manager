# README

How to start the app

Ruby: 2.3.0

1. Open console and go to project root folder
2. bundle install
3. rake db:create db:migrate db:seed
4. rails s

Seed users credentials
1. Email: admin@mail.com    | Pass: abc123  | role: Admin
2. Email: client@mail.com   | Pass: abc123  | role: Client

API Endpoints

* GET /api/vehicles

* POST /api/vehicles
body: { 
    "vehicle":{
        "plate": "ABC123",
        "color": "olive",
        "year": "1969"
    }
}


Run test:
1. bundle exec rspec spec/controllers/vehicles_controller.rb
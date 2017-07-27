require "rails_helper"

RSpec.describe Api::VehiclesController, :type => :controller do
	describe "GET /api/vehicles" do
		it "responds with status 200" do
			get :index

			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "fetches vehicles list" do
			FactoryGirl.create_list(:vehicle, 1)
			get :index
			json = JSON.parse(response.body)

			expect(response).to be_success
			expect(json["data"]["count"]) == 1
		end
	end

	describe "POST /api/vehicles" do
		vehicle = FactoryGirl.build(:vehicle)
		context "new vehicle success" do
			before do
				post :create, {vehicle: {plate: vehicle.plate, color: vehicle.color, year: vehicle.year}}
			end

			it "creates a new vehicle" do
				expect(Vehicle.last.plate).to eq(vehicle.plate)
			end
		end
	end
end
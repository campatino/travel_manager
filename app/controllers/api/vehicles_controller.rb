class Api::VehiclesController < ApplicationController

    skip_before_action :verify_authenticity_token


	def index
		response = {success: true, data: { count: Vehicle.all.count, vehicles: Vehicle.all.map{ |v| {id: v.id, plate: v.plate, category: v.category_name, color: v.color, year: v.year} } } }
		status = :ok

		render json: response, status: status
	end

	def create
		if params[:vehicle].nil? or params[:vehicle][:plate].nil? or params[:vehicle][:color].nil? or params[:vehicle][:year].nil?
			response = {success: false, message: "Missing parameters."}
			status = :forbidden
		else
			vehicle = Vehicle.new vehicle_params
			if vehicle.plate.upcase.start_with?("ABC", "DFG")
				if Vehicle.find_by(plate: vehicle.plate.upcase).nil?
					if vehicle.save
						response = {success: true, message: "Vehicle successfully created."}
						status = :ok
					else
						response = {success: true, message: "Error saving vehicle. Contact administrator."}
						status = :bad_request
					end
				else
					response = {success: false, message: "Vehicle already exists."}
					status = :forbidden
				end
			else
				response = {success: false, message: "Invalid plate."}
				status = :forbidden
			end
		end

		render json: response, status: status
	end

	private
	def vehicle_params
		params.require(:vehicle).permit(:plate, :color, :year)
    end
end
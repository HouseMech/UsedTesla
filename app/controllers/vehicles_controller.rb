class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all.where(sold: false)
  end

  def sold
    @vehicles = Vehicle.all.where(sold: true)
  end

  def show
    @current_vehicle = Vehicle.find_by(vin: params[:id])
    @current_vehicle_data = @current_vehicle.vehicle_data.all
  end
end

class DataController < ApplicationController
  #The index page grab the price data from each of the used Tesla models and insert it into a graph.
  def index
    @current_car = Car.first
    @current_car_data = @current_car.car_data.all
  end
end

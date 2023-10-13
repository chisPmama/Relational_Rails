class RestaurantEmployeesController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant_employees = Restaurant.find(params[:restaurant_id]).employees
  end

end
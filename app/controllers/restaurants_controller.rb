class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all.order(created_at: :desc)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @employee_count = @restaurant.employee_count
  end
end
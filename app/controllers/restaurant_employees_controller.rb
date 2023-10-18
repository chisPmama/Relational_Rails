class RestaurantEmployeesController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    return @restaurant_employees = @restaurant.alphabetical if params[:sort] == 'asc'
    # return @restaurant_employees = @restaurant.filter(wage_filter) if params[:wage_filter]!= nil
    @restaurant_employees = @restaurant.employees
  end

  def new
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.find(params[:id])
    @restaurant_employee = @restaurant.employees.create(employee_params)
    redirect_to "/restaurants/#{@restaurant.id}/employees"
  end

  private
  def employee_params
    params.permit(:name,:position,:active, :hired_date, :hourly_wage,:salary)
  end
end
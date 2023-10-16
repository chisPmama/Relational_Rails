class RestaurantEmployeesController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant_employees = Restaurant.find(params[:restaurant_id]).employees
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
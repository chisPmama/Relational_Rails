class EmployeesController < ApplicationController
  def index
    @employees = Employee.all.where("active=true")
  end

  def show
    @employee = Employee.find(params[:id])
  end
  
  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    @employee.update(employee_params)
    redirect_to "/employees/#{@employee.id}"
  end

  private
  def employee_params
    params.permit(:name,:position,:active, :hired_date, :hourly_wage, :salary)
  end

end
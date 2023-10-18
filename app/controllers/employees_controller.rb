class EmployeesController < ApplicationController
  def index
    @employees = Employee.all_active
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

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to "/employees"
  end

  private
  def employee_params
    params.permit(:name,:position,:active, :hired_date, :hourly_wage, :salary)
  end

end
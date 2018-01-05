class EmployeesController < ApplicationController
  def index
    @emps = Employee.all
  end
  
  def create
    @emp = Employee.new(emp_params)
    @emp.save
    redirect_to employees_url
  end
  
  def update
    @emp = Employee.find(params[:id])
    @emp.update(emp_params)
    redirect_to employees_url
  end
  
  private
  def emp_params
    params.require(:employee).permit(:name)
  end
end

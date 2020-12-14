class EmployeesController < ApplicationController
#     before_action :alias_validation, :title_validation

   def index
      @employees = Employee.all
   end

   def show
      @employee = Employee.find(params[:id])
   end

   def edit
      @employee = Employee.find(params[:id])
   end

   def new
      @employee = Employee.new
   end

   def create
      @employee = Employee.new(employee_params)
      if @employee.valid?
        @employee.save
        redirect_to employee_path(@employee)
      else
        @employee_errors = @employee.errors.full_messages
        redirect_to new_employee_path
      end
   end

   def update
      @employee = Employee.find(params[:id])
      @employee.update(employee_params.except(:alias, :title))
      redirect_to employee_path(@employee)
   end

   def destroy
      @employee = Employee.find(params[:id])
      @employee.destroy
      redirect_to employees_path
   end

   private

   def employee_params
      params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
   end


end

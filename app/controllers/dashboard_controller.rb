class DashboardController < ApplicationController
  layout 'mobile'
  def index
    @employees = Employee.all
  end

  def assignment
    @employees = Employee.all
  end
end

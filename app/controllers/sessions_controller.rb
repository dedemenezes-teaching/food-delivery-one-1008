# frozen_string_literal: true

require_relative '../views/session_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @session_view = SessionView.new
  end

  def login
    # 1. Ask for the employee username
    username = @session_view.ask_for('username')
    # 2. Ask for the employee password
    password = @session_view.ask_for('password')
    # 3. Find the employee by the username (Repository)
    employee = @employee_repository.find_by_username(username)
    # 4. Check if the password match
    if employee && password == employee.password
      @session_view.welcome(employee)
      employee # We return the instance of employee found to use in the router!
    else
      @session_view.wrong_credentials
      login # Recursive call. We are calling the method inside the method it self
    end
  end
end

# frozen_string_literal: true

require_relative './repositories/employee_repository'

csv_path = './data/employees.csv'
employee_repo = EmployeeRepository.new(csv_path)
p employee_repo

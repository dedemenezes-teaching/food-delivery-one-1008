# frozen_string_literal: true

require 'csv'
require_relative '../models/employee'

class EmployeeRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @employees = []
    load_csv
  end

  def find_by_username(username)
    @employees.find { |employee| employee.username == username }
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      # PREPARE THE ROW
      row[:id] = row[:id].to_i
      # INSTANTIATE THE EMPLOYEE
      # POPULATE THE EMPLOYEES ARRAY
      @employees << Employee.new(row)
    end
  end
end

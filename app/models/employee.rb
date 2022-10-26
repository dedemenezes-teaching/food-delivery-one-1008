# frozen_string_literal: true

class Employee
  attr_reader :password, :username, :role

  # STATE
  # id => Integer
  # username #=> String
  # password #=> String
  # role #=> String (manager/rider)
  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
  end
end

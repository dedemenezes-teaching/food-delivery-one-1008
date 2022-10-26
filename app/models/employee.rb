# frozen_string_literal: true

class Employee
  attr_reader :password, :username, :role
  attr_accessor :id
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

  def manager?
    @role == 'manager'
  end

  def rider?
    @role == 'rider'
  end
end

# frozen_string_literal: true

require_relative '../views/customer_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomerView.new
  end

  def add
    # 1. Ask for the name (VIEW)
    name = @view.ask_for('name')
    # 2. Ask for the address (VIEW)
    address = @view.ask_for('address')
    # 3. Instantiate this new customer (CONTROLLER)
    customer = Customer.new(name: name, address: address)
    # 4. Store in the repo (REPOSITORY)
    @customer_repository.create(customer)
  end

  def list
    # 1. Ask the repo for all the customers
    customers = @customer_repository.all
    # 2. Ask the view to display them
    @view.display(customers)
  end
end

class Order
  attr_accessor :id
  attr_reader :meal, :employee, :customer

  # STATE
  # id, a meal, a customer, an employee and delivered boolean
  def initialize(attributes = {})
    @id = attributes[:id]
    @meal = attributes[:meal]
    @customer = attributes[:customer]
    @employee = attributes[:employee]
    @delivered = attributes[:delivered] || false
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end

  # attr_reader is doing it for us!
  # def meal
  #   @meal
  # end
end

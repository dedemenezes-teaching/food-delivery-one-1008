require_relative '../views/meal_view.rb'
require_relative '../views/customer_view.rb'
require_relative '../views/session_view.rb'
require_relative '../views/order_view.rb'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @meal_view = MealView.new
    @customer_view = CustomerView.new
    @session_view = SessionView.new
    @order_view = OrderView.new
  end

  def set_meal
    meals = @meal_repository.all
    # 2. Display all the meals
    @meal_view.display(meals)
    # 3. Ask the user which one the user want
    meal_index = @order_view.ask_for('index').to_i - 1
    # 4. Retrieve the right instance from the array
    meals[meal_index]
  end

  def set_customer
    # 1. Get all the customers
    customers = @customer_repository.all
    # 2. Display all the customers
    @customer_view.display(customers)
    # 3. Ask the user which one the user want
    customer_index = @order_view.ask_for('index').to_i - 1
    # 4. Retrieve the right instance from the array
    customers[customer_index]
  end

  def add
    # INSTANCE OF MEAL
    # 1. Get all the meals
    meal = set_meal

    customer = set_customer

    # INSTANCE OF EMPLOYEE
    # 1. GET ALL THE RIDERS
    riders = @employee_repository.all_riders
    # 2. Display the riders
    @session_view.display(riders)
    # 3. Ask the user which one the user want
    rider_index = @order_view.ask_for('index').to_i - 1
    # 4. Retrieve the right instance from the array
    rider = riders[rider_index]


    order = Order.new(meal: meal, customer: customer, employee: rider)
    @order_repository.create(order)
  end

  def list_undelivered_orders
    # 1. Get all the undelivered orders
    undelivered_orders = @order_repository.undelivered_orders
    # 2. display them all
    @order_view.display(undelivered_orders)
  end

  def list_my_orders(employee)
    my_undelivered_orders = @order_repository.undelivered_orders.select do |order|
      order.employee == employee
    end
    @order_view.display(my_undelivered_orders)

    return my_undelivered_orders
  end

  def mark_as_delivered(employee)
    # 1. Get all the undelivered orders for the employee
    # 2. display the undelivered orders
    my_undelivered_orders = list_my_orders(employee)
    # 3. Ask for the order which was delivered
    index = @order_view.ask_for('index').to_i - 1
    order = my_undelivered_orders[index]
    # 4. Mark as delivered
    # 5. Save to csv
    @order_repository.mark_as_delivered(order)
  end
end

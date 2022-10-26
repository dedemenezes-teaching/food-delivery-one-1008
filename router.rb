# frozen_string_literal: true

class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @sessions_controller = sessions_controller
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    puts 'Welcome to Food Delivery'
    puts '------------------------'
    while @running
      # We need an instance of empoyee to check their role
      # The sessions controller METHOD login found an instance
      # we make it return the instance to use it here
      @employee = @sessions_controller.login
      while @employee
        if @employee.role == 'manager'
          display_manager_menu
          action = gets.chomp
          # ROUTE TO THE RIGHT CONTROLLER
          route_manager_to_action(action)
        else
          display_rider_menu
          action = gets.chomp
          # ROUTE TO THE RIGHT CONTROLLER
          route_rider_to_action(action)
        end
      end
    end
  end

  def display_manager_menu
    puts '1. Add a meal'
    puts '2. List all meals'
    puts '3. Add a customer'
    puts '4. List all customers'
    puts '5. Logout'
    puts '6. Quit'
  end

  def route_manager_to_action(action)
    case action
    when '1'
      @meals_controller.add
    when '2'
      @meals_controller.list
    when '3'
      @customers_controller.add
    when '4'
      @customers_controller.list
    when '5'
      @employee = nil
    when '6'
      @employee = nil
      @running = false
      puts 'Bye! See you zo/'
    else
      puts 'Choose a valid action'
    end
  end

  def display_rider_menu
    puts '1. List undelivered orders'
    puts '2. Mark an order as delivered'
    puts '3. Logout'
    puts '4. Quit'
  end

  def route_rider_to_action(action)
    case action
    when '1'
      puts 'TODO -> List undelivered orders'
    when '2'
      puts 'TODO -> Mark an order as delivered'
    when '3'
      @employee = nil
    when '4'
      @employee = nil
      @running = false
      puts 'Bye! See you zo/'
    else
      puts 'Choose a valid action'
    end
  end
end

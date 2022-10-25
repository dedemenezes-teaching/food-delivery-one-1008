# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    puts "Welcome to Food Delivery"
    puts '------------------------'
    while @running
      display_menu
      action = gets.chomp
      # ROUTE TO THE RIGHT CONTROLLER
      route_to_action(action)
    end
  end

  def display_menu
    puts "1. Add a meal"
    puts "2. List all meals"
    puts "3. Add a customer"
    puts "4. List all customers"
    puts "5. Quit"
  end

  def route_to_action(action)
    case action
    when '1'
      # run the add action from the meals controller
      @meals_controller.add
    when '2'
      @meals_controller.list
    when '3'
      @customers_controller.add
    when '4'
      @customers_controller.list
    when '5'
      @running = false
      puts 'Bye! See you zo/'
    else
      puts "Choose a valid action"
    end
  end
end

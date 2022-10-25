require_relative '../views/meal_view.rb'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealView.new
  end

  def add
    # 1. Ask for the name (VIEW)
    name = @view.ask_for('name')
    # 2. Ask for the price (VIEW)
    price = @view.ask_for('price').to_i
    # 3. Instantiate this new meal (CONTROLLER)
    meal = Meal.new(name: name, price: price)
    # 4. Store in the repo (REPOSITORY)
    @meal_repository.create(meal)
  end

  def list
    # 1. Ask the repo for all the meals
    meals = @meal_repository.all
    # 2. Ask the view to display them
    @view.display(meals)
  end
end

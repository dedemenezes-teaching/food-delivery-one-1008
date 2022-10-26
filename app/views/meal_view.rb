# frozen_string_literal: true

require_relative 'base_view'
class MealView < BaseView
  def display(meals_array)
    meals_array.each_with_index do |meal, index|
      puts "#{index + 1} - #{meal.name} - #{meal.price}"
    end
  end
end

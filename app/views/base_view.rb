# frozen_string_literal: true

class BaseView
  def ask_for(item)
    puts "#{item.capitalize}?"
    gets.chomp
  end
end

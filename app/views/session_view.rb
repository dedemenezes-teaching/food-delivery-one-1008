# frozen_string_literal: true

class SessionView
  def ask_for(item)
    puts "#{item.capitalize}?"
    gets.chomp
  end

  def wrong_credentials
    puts 'Sorry...Wrong credentials. Try again.' #=> nil
  end

  def welcome(employee)
    puts "Welcome #{employee.username}"
  end
end

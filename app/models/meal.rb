class Meal
  attr_reader :name, :price
  attr_accessor :id

  def initialize(attributes = {})
    # id, name, price
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end

  def self.csv_header
    [:id, :name, :price]
  end

  def to_csv
    [@id, @name, @price]
  end

  def self.prepare_row(row)
    row[:id] = row[:id].to_i
    row[:price] = row[:price].to_i

    row
  end
end

# empadao = Meal.new(name: 'Empadao', price: 10)
# puts empadao.name
# puts empadao.price
# empadao.id = 1
# puts empadao.id

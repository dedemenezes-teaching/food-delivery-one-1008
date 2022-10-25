class Customer
  # id, a name and an address.
  attr_reader :name, :address
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @address = attributes[:address]
  end

  def self.csv_header
    [:id, :name, :address]
  end

  def to_csv
    [@id, @name, @address]
  end

  def self.prepare_row(row)
    row[:id] = row[:id].to_i

    row
  end
end

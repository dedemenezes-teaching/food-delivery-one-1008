# frozen_string_literal: true

class BaseRepository
  def initialize(csv_file_path, the_klass)
    @csv_file_path = csv_file_path
    @the_klass = the_klass #=> Meal OR Customer
    @elements = []
    # load all the meals from csv
    load_csv if File.exist?(@csv_file_path) #=> inline IF
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end

  def all
    @elements
  end

  def create(element)
    # ASSIGN AN ID
    # if meals([]) is empty should be 1
    # if meals([]) has 9 meals it should be 10
    element.id = @elements.empty? ? 1 : @elements.last.id + 1
    @elements << element
    save_csv
  end

  private

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      # PUSH HEADERS
      # Meal OR Customer
      csv << @the_klass.csv_header
      @elements.each do |element|
        # CSV CAN ONLY STORE ARRAY OF STRINGS
        csv << element.to_csv
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      # PREPARE THE ROW
      # Cast to the right data type
      row = @the_klass.prepare_row(row)
      element = @the_klass.new(row)

      # POPULATE OUR MEALS ARRAY
      @elements << element
    end
  end
end


  class Car
    attr_accessor :make, :model, :year, :mileage

    def initialize(make, model, year, mileage)
      @make = make
      @model = model
      @year = year
      @mileage = mileage
    end

    def info
      puts "Гараж- #{@make} #{@model} #{@year} випуску з пробігом #{@mileage}, яка би не була усе одно ГАВНО"
    end     
  end


module Garage_metods
  def add_car(car)
    @cars << car
  end
  
  def list_cars
    puts "Перелік всіх авто"
    @cars.each {|car| puts car.info}
  end
  
  def find_by(make)
    puts "Результат пошуку: "
    cars = []
    @cars.select { |car| car.make == make}
    p cars.count
  end
  
  def total_cars
    puts "кількість авто в Гаражі: "
    @cars.size
  end
end


module AutoPark
  extend  Garage_metods
  @cars = []
  class << self
    attr_reader :cars

    def initialize
      @cars = []
    end
  end  
end


car1 = Car.new("Toyota", "Camry", 2019, 30000)
AutoPark.add_car(car1)
AutoPark.list_cars
car2 = Car.new("Ford", "Mustang", 1980, 90000)

AutoPark.add_car(car2)
AutoPark.total_cars
#puts "#{AutoPark.total_cars}"
car3 = Car.new("Opel", "Mokka", 2020, 15000)
AutoPark.add_car(car3)
AutoPark.list_cars
AutoPark.find_by('Ford')
#puts "Перевірка лічильника #{AutoPark.total_cars}"


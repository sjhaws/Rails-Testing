require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'attributes' do
    # it 'has a make' do
    #   make = 'Toyota'
    #   car = Car.create(make: make)
    #   expect(car.make).to eq(make)
    # end

    # it "has a model" do
    #   model = 'Camera'
    #   car = Car.create(model: model)
    #   expect(car.model).to eq(model)
    # end

    # it "has a age" do
    #   age = 4
    #   car = Car.create(age: age)
    #   expect(car.age).to eq(age)
    # end

    it { should respond_to :make }
    it { should respond_to :model }
    it { should respond_to :price }
    it { should respond_to :color }
    it { should respond_to :interior }
    it { should respond_to :mileage }
  end

  describe 'class methods' do
    before(:each) do
      @car1 = Car.create(make: 'Chevy', model: 'Silverado', price: 30000)
      @car2 = Car.create(make: 'Honda', model: 'Pilot', price: 5000)
      @car3 = Car.create(make: 'Ford', model: 'Focus', price: 10000)
    end

    it 'sorts by car model' do
      cars = Car.by_model
      expect(cars).to eq([@car3, @car2, @car1])
    end

    it 'sorts by car make' do
      cars = Car.by_make
      expect(cars).to eq([@car1, @car3, @car2])
    end

    it 'sorts by price' do
      cars = Car.by_price(true)
      expect(cars).to eq([@car1, @car3, @car2])
    end

  end

  describe 'validations' do
    it { should validate_presence_of(:make)}
  end

end
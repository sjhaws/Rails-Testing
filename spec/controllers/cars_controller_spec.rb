require 'rails_helper'

RSpec.describe CarsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'sets the cars instance variable' do
      get :index
      expect(assigns(:cars)).to eq([])
    end

    it 'has cars in the instance variable' do
      3.times { |index| 
        Car.create(
          make: "make_#{index}",
          model: "car model",
          age: 4,
          price: 20000.00,
          mileage: 10000,
          color: 'green',
          interior: 'leather'
        )
      }
      get :index
      expect(assigns(:cars).length).to eq(3)
      expect(assigns(:cars).last.make).to eq('make_2')
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      car = Car.create(
          make: "Ford",
          model: "Ram",
          age: 4,
          price: 20000.00,
          mileage: 10000,
          color: 'green',
          interior: 'leather'
        )
      get :show, params: { id: car.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end
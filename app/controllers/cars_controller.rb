class CarsController < ApplicationController
  before_action :car, except: [:index, :new, :create]

 def index
   @cars = Car.all
 end

 def show
 end

 def new
   @car = Car.new
 end

 def create
   @car = Car.new(car_params)
   if @car.save
     flash[:success] = 'Car created!'
     redirect_to car_path(@car)
   else
     render :new
   end
 end

 def edit
 end

 def update
   if @car.update(car_params)
     flash[:success] = 'Car updated!'
     redirect_to car_path(@car)
   else
     render :edit
   end
 end

 def destroy
   @car.destroy
   flash[:success] = 'Car deleted!'
   redirect_to cars_path
 end

 private
  def car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:make, :model, :age, :price, :mileage, :color, :interior)
  end
end

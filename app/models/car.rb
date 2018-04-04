class Car < ApplicationRecord
  validates_presence_of :make

  def self.by_model
    order(:model)
  end

  def self.by_make
    order(:make)
  end

  def self.by_price( high = false)
    if high
      order(price: :desc)
    else
      order(:price)
    end
  end

  def paint(color)
    self.update(color: color)
  end

  def honk
    "beep"
  end
end

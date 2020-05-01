class Game

  attr_accessor :title, :original_price, :percent_off, :discounted_price

  @@all = []
  @@count = 0
  def initialize(title, original_price, percent_off, discounted_price)

    @title = title
    @original_price = original_price
    @percent_off = percent_off
    @discounted_price = discounted_price

    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy
    @@all = []
  end

end

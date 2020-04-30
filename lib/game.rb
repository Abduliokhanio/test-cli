require_relative "scraper.rb"

class Game

  attr_accessor :title, :original_price, :percent_off, :discounted_price

  @@all = []

  def initialize(title, original_price, percent_off, discounted_price)
    @title = title
    @original_price = original_price
    @percent_off = percent_off
    @discounted_price = discounted_price

    @@all << self
  end

end

kh = Game.new("kh", 20, 10, 18)

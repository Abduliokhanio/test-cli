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

  def title
    @title = title
  end

end

kh = Game.new

class Game

    attr_accessor :title, :original_price, :percent_off
  
    @@all = []
    def initialize(title, original_price, percent_off)
  
      #mass assingment
      @title = title
      @original_price = original_price
      @percent_off = percent_off

      attr_accessor(:dev)
  
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def self.destroy
      @@all = []
    end
  
end


gta = Game.new('gta', '$12', '50% OFF')

puts gta.title
puts gta.original_price
puts gta.percent_off
gta.dev = 'rockstar'
puts gta.dev

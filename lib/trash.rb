title = 'gta'
original_price = '$30'
percent_off = '50% OFF'
dev = 'rstar'
array1 = [title, original_price, percent_off,dev]

class Game

    attr_accessor :title, 
                  :original_price, 
                  :percent_off,
                  :dev
  
    @@all = []
    def initialize(array)

        accessor_array = [@title,@original_price,@percent_off,@dev]
  
      #mass assingment
      @title = array[0]
      accessor_array[1] = array[1]
      accessor_array[2] = array[2]
      accessor_array[3] = array[3]
  
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def self.destroy
      @@all = []
    end
  
end


gta = Game.new(array1)

puts gta.title
puts gta.original_price
puts gta.percent_off
puts gta.dev

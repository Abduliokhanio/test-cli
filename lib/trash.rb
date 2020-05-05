title = 'gta'
original_price = '$30'
percent_off = '50% OFF'
#dev = 'rstar'
array1 = [title, original_price, percent_off]

class Game

    attr_accessor :title, 
                  :original_price, 
                  :percent_off
                  
                  
    @@all = []
    @@hashy = {}
    def initialize(array)
  
      #mass assingment
      @title = array[0]
      @original_price = array[1]
      @percent_off = array[2]
      #@dev = array[3]
  
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def self.destroy
      @@all = []
    end

    def hash_builder
        @@hashy[:dev] = 'micor'
        @@hashy.each {|key, value| self.send(("#{key}="),(value))}
    end 

    def self.hashy
        @@hashy
    end 
  
end

gta = Game.new(array1)


gta.hash_builder
#puts Game.hashy
puts gta.dev
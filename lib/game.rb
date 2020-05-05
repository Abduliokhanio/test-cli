class Game

  attr_accessor :title, :original_price, :percent_off, 
                :discounted_price, :snip_bit, :game_review, 
                :developer, :des, :min_req, :rec_req

  @@all = []
  def initialize(game_array)

    game_array.each {|key, value| self.send(("#{key}="),(value))}

    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy
    @@all = []
  end

end

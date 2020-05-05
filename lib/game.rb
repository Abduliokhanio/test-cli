class Game

  attr_accessor :title, :original_price, :percent_off, 
                :discounted_price, :snip_bit, :game_review, 
                :developer, :des, :min_req, :rec_req

  @@all = []
  def initialize(game_array)

    #mass assingment
    @title = game_array[0]
    @original_price = game_array[1]
    @percent_off = game_array[2]
    @discounted_price = game_array[3]
    @snip_bit =  game_array[4]
    @game_review = game_array[5]
    @developer = game_array[6]
    @des =  game_array[7]
    @min_req =  game_array[8]
    @rec_req = game_array[9]

    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy
    @@all = []
  end

end

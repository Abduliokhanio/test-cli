class Game

  attr_accessor :title, :original_price, :percent_off, :discounted_price, :snip_bit, :game_review, :developer, :des, :min_req, :rec_req

  @@all = []
  @@count = 0
  def initialize(title, original_price, percent_off, discounted_price, snip_bit, game_review, developer, des, min_req, rec_req)

    #mass assingment
    @title = title
    @original_price = original_price
    @percent_off = percent_off
    @discounted_price = discounted_price
    @snip_bit =  snip_bit
    @game_review = game_review
    @developer = developer
    @des =  des
    @min_req =  min_req
    @rec_req = rec_req

    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy
    @@all = []
  end

end

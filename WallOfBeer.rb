class WallOfBeer
  attr_accessor :beer_stock

  def initialize(number_of_beers)
    @beer_stock = number_of_beers
  end

  def open_the_bar
    stock_check
    what_da_ya_want_to_do?
  end

  def stock_check
    if self.beer_stock < 10 && self.beer_stock != 0
      puts "Restock, buddy, the wall's running dry! The wall has #{self.beer_stock} to go!" 
    elsif self.beer_stock == 0
      abort "That's it, buddy. No more left!"
    else
      puts "The wall has #{self.beer_stock} left."
    end
  end

  def what_da_ya_want_to_do?
    stock_check unless self.beer_stock >= 10 
    
    puts %/
    What'da'ya want, buddy? You can:
    1) Drink green beer
    2) Restock green beer
    3) Check the stock
    4) Get the hell outta here!
    /
    
    input = gets.chomp
    drink_beer(input)
  end

  def drink_beer(input)
    case input.downcase
      when "1", "drink green beer"
        self.beer_stock -= 1
        puts "That is one tasty green beer. Only #{self.beer_stock} left to go!" unless self.beer_stock == 0
      when "drink beer"
        puts "We only got the green stuff here, buddy."
      when "2", "restock green beer"
        self.beer_stock = 99
      when "3", "check the stock"
        stock_check
      when "4", "get the hell outta here", "get the hell outta here!"
        exit
      else
        puts "Say something sensical, ya maniac"
    end
    what_da_ya_want_to_do?
  end
end

GreatWallOfBeer = WallOfBeer.new(99)
GreatWallOfBeer.open_the_bar

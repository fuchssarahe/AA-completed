

class Human
attr_reader :name

  def initialize(name)
    @name = name
    @previous_guess = []
  end



  def make_guess(board_size)
    puts "Choose which card you want to check"
    guesses = gets.chomp.gsub(/\D/,"/").split("/").reject{|el| el.empty? }
    guess = guesses.map {|chr| chr.to_i }

    guess.each do |num|
      if num >= board_size || @previous_guess == guess
        puts "Invalid position!"
        guess = make_guess(board_size)
      end
    end

    @previous_guess = guess
    guess
  end

  def receive_revealed_card(pos, val)
  end





end

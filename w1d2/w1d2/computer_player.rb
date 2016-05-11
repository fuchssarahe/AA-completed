class Computer
  attr_reader :name

  def initialize
    @name = "Computer"
    @previous_guess=[]
    @known_cards = {}
    @matched_cards = {}

  end

  def make_guess(board_size)
    # if @matched_cards.length == 0
      guess = generate_random_position(board_size)
      generate_random_position(board_size).each do |num|
        if num >= board_size || @previous_guess == guess
          puts "Invalid position!"
          guess = make_guess(board_size)
        end
      # end

    # else
    #   guess = generate_match

    end

    @previous_guess = guess.dup
    p @known_cards
    p @matched_cards
    guess

  end

  # def generate_match
  #   if @matched_cards.has_key?(@previous_matched_guess)
  #
  #     guess = @matched_cards[@previous_matched_guess]
  #     @matched_cards.delete(@previous_matched_guess)
  #
  #   else
  #     guess = @matched_cards.keys.first
  #     @previous_matched_guess = guess
  #   end
  #  guess
  # end

  def receive_match(pos1, pos2)
   @matched_cards[pos1] = pos2
 end

  def receive_revealed_card(pos, val)
    if @known_cards.has_value?(val)
      receive_match(pos, @known_cards.key(val))
    else
      @known_cards[pos] = val
    end
  end
  #
  #
  #
  def generate_random_position(board_size)
    pos = []
    2.times do
      pos << rand(board_size)
    end
     generate_random_position(board_size) unless validate_pos?(pos)
     pos
  end

   def validate_pos?(pos)
      !@known_cards.has_key?(pos)
   end

end

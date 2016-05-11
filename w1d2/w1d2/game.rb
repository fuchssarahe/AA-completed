
require_relative "board"
require_relative "human_player"
require_relative "computer_player"

class Game
  attr_accessor :board

  def initialize(size, player)
    @board = Board.new(size)
    @player = player
  end


  def render
     @board.render
  end

  def play_turn
    pos1 = get_and_process_guess
    pos2 = get_and_process_guess

    @board.reveal(pos1, pos2)
    render

    unless board.cards_equal?(pos1,pos2)
      @board.hide(pos1, pos2)
      puts "Wrong match, #{@player.name}!"
      sleep(2)
      system("clear")
      render
    end
  end

  def get_and_process_guess
    pos = @player.make_guess(@board.size)
    value = @board[*pos].value
    @player.receive_revealed_card(pos, value)
    pos
  end

  def won?
    @board.won?
  end

  def play
    @board.populate
    until won?
      play_turn
    end
    puts "Winner!"
  end

end


if __FILE__ == $PROGRAM_NAME
  player = Computer.new
  Game.new(2, player).play
end

require 'set'
require_relative 'Player'

class Game
  attr_reader :current_player, :previous_player

  def initialize(dictionary, *players)
    @fragment = ""
    @current_player = players[1]
    @previous_player = players[0]
    @dictionary = setify_file(dictionary)
    @losses = hashify_losses(players)
    @players = players
  end

  def hashify_losses(players)
    losses = {}
    players.each do |player|
      losses[player] = 0
    end
    losses
  end

  def setify_file(document)
    words = Set.new
    File.foreach(document) do |line|
      words << line.chomp.downcase
    end
    words
  end

  def next_player!
    current_player_index = @players.index(@current_player)
    next_index = (current_player_index + 1) % @players.length
    @previous_player = @current_player
    @current_player = @players[next_index]
    if player_lost?(@previous_player)
      remove_losing_player(@previous_player)
    end
  end

  def remove_losing_player(player)
    @players.delete(player)
    puts "#{player.name} has been banished from the game!"
  end

  def take_turn(player)
    potential_fragment = @fragment + player.guess
    if valid_play?(potential_fragment)
      @fragment = potential_fragment
      puts "Current fragment is #{@fragment}"
    else
      @losses[player] += 1
      ghost_str = self.record(player)
      player.alert_invalid_guess(ghost_str)
    end
  end

  def valid_play?(string)
    @dictionary.each do |word|
      if word.length > string.length && word.include?(string)
        return true
      end
    end
    false
  end

  def player_lost?(player)
    @losses[player] > 4
  end

  def over?
    @players.length == 1
  end

  def run
    until over?
      play_round
    end
    puts "Game over! #{@players[0].name} won!"
  end

  def play_round
    take_turn(@current_player)
    next_player!
  end

  def record(player)
    str = "GHOST"
    str[0...@losses[player]]
  end

end


if __FILE__ == $PROGRAM_NAME
  player1 = Player.new("Jim")
  player2 = Player.new("Susan")
  player3 = Player.new("JoAnn")
  Game.new("dictionary.txt", player1, player2, player3).run
end

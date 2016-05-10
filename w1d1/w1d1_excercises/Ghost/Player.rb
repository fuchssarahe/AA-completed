class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess
    puts "#{@name}, which letter would you like to add?"
    letter = gets.chomp.downcase
  end

  def alert_invalid_guess(ghost_str)
    puts "Invalid guess!"
    puts "That's #{ghost_str}!"
  end

end

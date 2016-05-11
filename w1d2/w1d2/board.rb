require_relative "card"

class Board
attr_reader :size


  def initialize(size)
    valid_size?(size) ? @size = size : @size = 4 #width of board - must be an odd number
    @grid = []
  end

  def [](row, col)
    @grid[row][col]
  end

  def []=(row, col, mark)
    @grid[row][col] = mark
  end

  def valid_size?(size)
    size % 2 == 0
  end

  def get_cards
    cards = []
    pairs = (@size**2) / 2
    (0...pairs).each do |val|
      2.times {cards << Card.new(val)}
    end
    cards.shuffle!
  end

  def populate
    cards = get_cards
    @size.times { @grid << cards.pop(@size) }
  end

  def render
    arr = []
    @grid.each do |row|
      inner_row = []
      row.each do |card|
        inner_row << card.to_s
      end
      arr << inner_row
    end
     p arr
  end

  def won?
    @grid.each do |row|
      row.each do |card|
        return false if card.face_down
      end
    end
    true
  end

  def reveal(pos1, pos2)
    card1 = self[*pos1]
    card2 = self[*pos2]
    if valid_move?(pos1, pos2)
        card1.reveal(card2)
    end
  end

  def hide(pos1, pos2)
    card1 = self[*pos1]
    card2 = self[*pos2]
    card1.hide(card2)
  end

  def valid_move?(pos1, pos2)
    self[*pos1].face_down && self[*pos2].face_down
  end

  def cards_equal?(pos1, pos2)
    puts " val #{pos1} - #{self[*pos1]}"
    puts " val #{pos2} - #{self[*pos2]}"
    self[*pos1] == self[*pos2] && pos1 != pos2
  end

end

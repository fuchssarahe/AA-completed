class Card
  attr_accessor :face_down
  attr_reader :value
  # false -> flipped card; true -> face-down card

  def initialize(value)
    @value = value
    @face_down = true
  end

  def hide(card)
    @face_down = true
    card.face_down = true
  end

  def reveal(card)
    @face_down = false
    card.face_down = false
  end

  def to_s
    @face_down ? "X" : @value.to_s
  end

  def ==(card)
    @value == card.value
  end

end

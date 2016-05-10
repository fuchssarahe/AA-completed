# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)
  words = str.split(" ")
  shifted_words = words.map do |word| 
    shift_letters(word, shift)
  end
  shifted_words.join(" ")
end

def shift_letters(word, shift)
  word = word.downcase.split("")
  shifted_letters = word.map do |letter| 
    new_num = letter.ord + shift
    new_num -= 26 if new_num > 122
    new_num += 26 if new_num < 97
    new_num.chr   
  end
  shifted_letters.join
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def digital_root(num)
  # No clue how to do this without string conversion. Gonna keep thinking about it... 
  num if num < 10
end

def digital_root_step(num)
  
end

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'olleh'

def jumble_sort(str, alphabet = nil)
  alphabet ||= ("a".."z").to_a 
  str = str.downcase.split("")
  result = []
  alphabet.each do |letter|
    str.each do |character|
       result << character if letter == character
    end
  end
  result.join("")
end

class Array
  # Write an array method that returns `true` if the array has duplicated
  # values and `false` if it does not
  def dups?
    array = self.sort
    (0...array.length-1).each do |idx|
      return true if array[idx] == array[idx+1]
    end
    false
  end
end

# Determine if a string is symmetrical. 'racecar' and 'too hot to hoot' are
# examples of symmetrical strings.
#
# Do NOT use any built-in `reverse` methods.

class String
  def symmetrical?
    original = self.split(" ").join("").downcase
    flipped = "" 
    original.each_char do |letter|
      flipped = letter + flipped
    end
    flipped == original
  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  factors = [1]
  (2..num).each do |comparer|
    factors << comparer if num % comparer == 0
  end
  factors
end


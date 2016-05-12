def make_change(amount, coins = [25,10,5,1])
  return [amount] if coins.include?(amount)
  
  change = Array.new(amount)
  
  coins.each do |coin|  
    guess = []
    
    if amount >= coin
      guess << coin
      sub_amount = amount - coin 
      sub_change = make_change(sub_amount, coins)
      guess += sub_change unless sub_change.include?(nil)

      if guess.length < change.length && valid_change?(amount, guess)
        change = guess
       end   
    end
    
  end

  change

end


def valid_change?(amount, change)
  amount == change.inject {|acc, num| acc + num.to_i }
end


p make_change(26)
p make_change(14)
p make_change(14, [10, 7, 1])
p make_change(14, [10, 9, 7, 1])
def sum_to(num)
  if num < 0
    return nil
  elsif num == 1
    return 1
  end
  num += sum_to(num - 1)
end

#  # Test Cases
#   p sum_to(5)  ==  15
#   p sum_to(1)  ==  1
#   p sum_to(9)  ==  45
#   p sum_to(-8)  == nil
  
  def add_numbers(nums_array = nil)
    return nil if nums_array.nil?
    return nums_array[0] if nums_array.length == 1
    nums_array[0] + add_numbers(nums_array[1..-1])
  end
  
  # # Test Cases
  # p add_numbers([1,2,3,4]) == 10
  # p add_numbers([3]) == 3
  # p add_numbers([-80,34,7])  ==  -39
  # p add_numbers() == nil
  
  def gamma_fnc(n)
    return nil if n <= 0
    return 1 if n <= 2
    (n - 1) * gamma_fnc(n-1)
  end
  
  #  # Test Cases
  # p gamma_fnc(0)  == nil
  # p gamma_fnc(1)  == 1
  # p gamma_fnc(4)  == 6
  # p gamma_fnc(8)  == 5040
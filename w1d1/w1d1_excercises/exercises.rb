class Array

  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end

    self
  end

  def my_select
    res = []
    self.my_each do |e|
      res << e if yield(e)
    end
    res
  end

  def my_reject
    res = []
    self.my_each do |e|
      res << e unless yield(e)
    end
    res
  end

  def my_any?
    self.my_each do |e|
      return true if yield(e)
    end
    false
  end

  def my_all?
    self.my_each do |e|
      return false unless yield(e)
    end
    true
  end

  def my_flatten
    res = []
    self.my_each do |el|
      if ! el.is_a?(Array)
        res << el
      else
        res += el.my_flatten
      end
    end
    res
  end

  def my_zip(*arrs)
    res = []
    self.each_index do |i|
      column = [self[i]]
      arrs.each do |arr|
        column << arr[i]
      end
      res << column
    end
    res
  end

  def my_rotate(step = 1)
    duplicate = self.dup
    step.abs.times do
      if step > 0
        a = duplicate.shift
        duplicate.push(a)

      elsif step < 0
        b = duplicate.pop
        duplicate.unshift(b)
      end
    end
    duplicate
  end

  def my_join(separator = "")
    res = ""
    self.each_with_index do |e, i|
      res += e
      break if i == self.length - 1
      res += separator
    end
    res
  end

  def my_reverse
    res = []
    (self.length-1).downto(0) do |idx|
      res << self[idx]
    end
    res
  end

end

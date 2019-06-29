def prime?(num)
  if num < 2
    return false
  end
  2.upto(Math.sqrt(num).to_i) do |i|
    if num%i == 0
      return false
    end
  end
  return true
end

9999999900.upto(10000000000) do |n|
  if prime?(n)
    puts("prime number:#{n}");
  end
end

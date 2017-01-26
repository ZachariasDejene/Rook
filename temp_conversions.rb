def convert(temp, measure)

return "Temperature must be an integer" unless temp.class == Fixnum
return "Temperature below Absolute Zero" if temp < -474

if measure == "C"
    puts (temp * 1.8) + 32
else
    puts 5 * (temp - 32)/9

end

end

puts convert(0, "C")
puts convert(10, "C")
puts convert(100, "C")
puts convert(-280, "C")
def convert(temp, measure)

return "Temperature must be an integer" unless temp.class == Fixnum
return "Temperature below Absolute Zero" if below_absolute_zero?(temp, measure)

if measure == "C"
    puts (temp * 1.8) + 32
else
    puts 5 * (temp - 32)/9

end

end

def below_absolute_zero?(temp, measure)
    (temp < -454 and measure == "F") or (temp < -270 and measure == "C")
end

puts convert(0, "C")
puts convert(10, "C")
puts convert(100, "C")
puts convert(-280, "C")
def start_array_while (max, inc)

  i = 0
  numbers = []

  while i < max
    puts "At the top, i is #{i}"
    numbers.push(i)

    i+=inc
    puts "Numbers now: #{numbers}"
    puts "At the bottom, i is #{i}"
  end

  puts "The numbers: "

  numbers.each do |num|
    puts num
  end

end

def start_array_for (max, inc)

  i = 0
  numbers = []

  for i in (0..max-1).step(2)
    puts "At the top, i is #{i}"
    numbers.push(i)

    puts "Numbers now: #{numbers}"
    puts "At the bottom, i is #{i}"
  end

  puts "The numbers: "

  numbers.each do |num|
    puts num
  end

end

start_array_while(1,2)
puts
start_array_for(1,2)
puts
start_array_while(5,2)
puts
start_array_for(5,2)
name='Zed A. Shaw'
age=35 #Not a lie
height=74 #inches
weight=180 #lbs
eyes='Blue'
teeth='White'
hair='Brown'

puts "Let's talk about %s." % name
puts "He's %d inches tall" % height
puts "He's %d pound heavy" % weight
puts "Actually that's not too heavy"
puts "He's got %s eyes an %s hair." % [eyes,hair]
puts "His teeth are usually %s depending on the coffe." % teeth

puts "If I add %d, %d, and %d I get %d." % [age, height, weight, age + height + weight]
states ={
  'Oregon' => 'OR',
  'Florida' => 'FL',
  'California' => 'CA',
  'New York' => 'NY',
  'Michigan' => 'MI'
}

cities = {
  'CA' => 'San Francisco',
  'MI' => 'Detroit',
  'FL' => 'Jacksonville'
}

cities['NY']='New York'
cities['OR']='Portland'

puts '-' * 10
puts "NY State has: #{cities['NY']}"
puts "OR State has: #{cities['OR']}"

puts '-' * 10
puts "Michigan's abbreviation is: #{states['Michigan']}"
puts "Florida's abbreviation is: #{states['Florida']}"

puts '-' * 10
puts "Michigan has: #{cities[states['Michigan']]}"
puts "Florida has: #{cities[states['Florida']]}"

puts '-' * 10
for state, abbrev in states
  puts "%s has the city %s" % [state,abbrev]
end

puts '-' * 10
for abbrev, city in cities
  puts "%s has the city %s" % [abbrev, city]
end

puts '-' * 10
for states, abbrev in states
  puts "%s states is abbreviated %s and has city %s" %[states, abbrev, cities[abbrev]]
end

puts '-' * 10
state = states['Texas']

if not state
  puts "Sorry, no Texas."
end

city = cities['TX'] || 'Does Not Exist'
puts "The city for the state 'TX' is: %s" % city

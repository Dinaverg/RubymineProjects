puts "name?"
my_name = gets.chomp
my_name.capitalize!
puts "surname?"
last_name=gets.chomp
last_name.capitalize!
puts "city?"
city=gets.chomp
city.capitalize!
puts "state/federal subdivision?"
state=gets.chomp
state.upcase!
print"MC #{my_name} #{last_name} straight outta #{city}, #{state}"
require 'socket'
puts "file to count?"
text = ""
filename=gets.chomp
File.foreach(filename)do |line|
text << "#{line.chomp} "
end
s = TCPSocket.open("localhost",8712)
s.puts text
s.close
puts "file sent..."
until "i"=="am bored"
puts "word counts to return?"
counted=gets.chomp.downcase
r = TCPSocket.open("localhost",2178)
r.puts counted
result = r.readline.split(",")
result.each{|wc| puts wc}
r.close
puts "Finished(y/n)?"
yesno=gets.chomp
 yesno=="y"? break : {}
  end

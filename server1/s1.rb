require 'socket'
puts "server engage..."
count=Hash.new(0)

=begin Hopefully this was a server?
server=TCPServer.new(8712)
puts "eyes on the port"
loop {
  client = server.accept
  line=server.gets.chomp
  line.upcase!
  client.puts(line)
  puts"Job's Done"
  client.close
}
=end


=begin Capitalizing server
Socket.tcp_server_loop(8712) do |conn,addr|
  begin
    text=conn.readline
    unless text=="close"
    puts "text recieved..."
    text.upcase!
    puts "bigified"
    conn.puts(text)
    puts "replied #{text}"
    else
      #still trying to make this work...
      conn.close
      puts "disengaged"
    end
  rescue EOFError
    #this is a comment
    conn.close
    puts "disengage"
  end
end
=end

counter=Thread.new do
puts "counter engage..."
Socket.tcp_server_loop(8712) do |conn,addr|

=begin
I got this code from the 'bare bones example in the
 tutorial and am not sure what addr is for...
=end

  begin
    text=conn.readline
    text.split.each{|w|
      w.downcase!
      count[w]+=1}
    puts "counted"
  rescue EOFError
    #this is a comment also
    conn.close
    puts "disengage"
  end
end
  puts "counter disengage"
end

=begin
I haven't yet figured out how to end this loop...
 so we're going multi-(well, double, at least)-threaded!
=end

returner=Thread.new do
puts "returner engage..."
  Socket.tcp_server_loop(2178) do |conn,addr|
begin
  words=conn.readline.split
  puts "selection recieved"
  reply = ""
  words.each do |w|
    puts w
    reply << "#{w}: #{count[w]},"
  end
  conn.puts reply
  end
end
puts "return disengage"
end

counter.join
returner.join

puts "server disengage"

#I'd make another thread to listen for a kill command, but eh...
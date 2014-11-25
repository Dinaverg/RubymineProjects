null=Hash.new(0)
a=Hash.new(0)
b=Hash.new(0)
a[:one]=3
a[:two]=4
b[:one]=2
b[:three]=5
null.merge!(a)
null.merge!(a).merge!(b)
#a.merge(b){|key,val1,val2| val1+val2}
a.each {|x,y|puts "#{x},#{y}"}
null.each {|x,y|puts "#{x},#{y}"}

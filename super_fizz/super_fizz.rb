(0..1000).each do |number|
  string = ""
  string += "Super" if number % 7 == 0
  string += "Fizz" if number % 5 == 0
  string += "Buzz" if number % 3 == 0
  string += number.to_s if string.empty?
  puts string
end

#one line solution
(0..1000).each{|n|puts (s="#{"Super" if n%7==0}#{"Fizz" if n%5==0}#{"Buzz" if n%3==0}").empty? ? n : s}

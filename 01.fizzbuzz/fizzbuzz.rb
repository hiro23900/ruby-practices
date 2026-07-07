(1..20).each { |n|
  (puts "FizzBuzz"; next) if n.modulo(3 * 5) == 0 
  (puts "Buzz"; next) if n.modulo(5)  == 0
  (puts "Fizz"; next) if n.modulo(3)  == 0
  puts n 
}


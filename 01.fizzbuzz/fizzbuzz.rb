(1..20).each do |num|
  (puts "FizzBuzz"; next) if num % (3 * 5) == 0
  (puts "Buzz"; next) if num % 5 == 0
  (puts "Fizz"; next) if num % 3 == 0
  puts num
end


=begin The program should take input to evaluate it's validity.
the input will be 10 digits long and will be evaluated using Luhn Algorithm.
=end

def luhn_step_to_array(card_number)
  numbers = card_number.reverse.split("")
  number_spread = Array.new()
  numbers.each do |digit| number_spread.push(digit) end
end

def luhn_step_odds_and_evens(number_spread)
  odds = number_spread.select.with_index { |_, i| i.odd?}
  evens = number_spread.select.with_index { |_, i| i.even?}
  odds.map! do |odd|
  if (odd.to_i * 2) > 9
    odd.to_i * 2 - 9
  elsif (odd.to_i * 2) < 10
    odd.to_i * 2
   end
 end
  evens.map! do |even|
    even.to_i
  end
 even_total =  evens.sum
 odd_total = odds.sum
 total_total = (even_total) + (odd_total)
 end

 def luhn_step_validation(total_total)
  if total_total % 10 == 0
    check_digit = 0
  else check_digit = (total_total[1] - 10)
 end
 final_total = total_total + check_digit
  if final_total % 10 == 0
  puts "Your credit card number is valid!"
  else puts "I'm sorry, that is not a valid credit card number."
 end
end

def user_prompt
loop do
puts "What credit card would you like to check for validity?"
input = gets.chomp.to_s
number_spread = luhn_step_to_array(input)
total_total = luhn_step_odds_and_evens(number_spread)
puts luhn_step_validation(total_total)

    loop do
      check = 0
    puts "Would you like to check another card number? Y/N"
    continue = gets.chomp.to_s.downcase
    @continue_counter = 0
    if continue == "y"
      check = 1
      @continue_counter = 0
    elsif continue == "n"
      check = 1
      @continue_counter = 1
    else puts "I'm sorry, I didn't understand your request."
    check = 0
    end
   break if check != 0
  end

break if @continue_counter != 0
 end
end

user_prompt
puts "Thank you!"

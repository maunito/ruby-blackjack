require_relative 'croupier'
require_relative 'black_jack'

J = 10
Q = 10
K = 10
A = 11

values = [2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K, A]

puts 'Welcome to Blackjack'
sleep_and_line_break

dealer_score = values.sample

player_score = player_start(values)
sleep_and_line_break

puts state_of_the_game(player_score, dealer_score)
sleep_and_line_break

if player_score == 21
  puts 'Blackjack!'
elsif player_score < 21
  puts 'another card? [ y / n ]'
  sleep_and_line_break
  answer = gets.chomp
  sleep_and_line_break
  until answer == 'no' || answer == 'n' || player_score >= 21 
    random_card = values.sample
    player_score += random_card
    puts "You pulled a #{random_card}"
    sleep_and_line_break
    puts state_of_the_game(player_score, dealer_score)
    sleep_and_line_break
    if player_score < 21
      puts 'another card? [ y / n ]'
      sleep_and_line_break
      answer = gets.chomp
      sleep_and_line_break
    elsif player_score == 21
      '21!'
      sleep_and_line_break
    end
  end
end

until dealer_score >= 17
  (dealer_card2 = values.sample)
  dealer_score += dealer_card2
  puts "The dealer pulled a #{dealer_card2} and has now #{dealer_score}"
  sleep_and_line_break
end


puts end_game_message(player_score, dealer_score)

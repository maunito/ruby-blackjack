require_relative "croupier"
require_relative "black_jack"

j = 10
q = 10
k = 10
a = 11

values = [2, 3, 4, 5, 6, 7, 8, 9, 10, j, q, k, a]

puts "welcome to blackjack"

dealer_score = pick_dealer_score(values)

player_score = player_start(values)

puts state_of_the_game(player_score, dealer_score)

puts "another card? [ y / n ]"
answer = gets.chomp


until answer == "no" || answer == "n" || player_score >= 21 do
  puts player_pick_another_card(values)
  player_score += random_card
  puts "You pulled a #{random_card}"
  puts state_of_the_game(player_score, dealer_score)
  if player_score < 21
    puts "another card?"
    answer = gets.chomp
  end
end

until dealer_score >= 17 do
  dealer_card2 = rand(1..11)
  dealer_score += dealer_card2
  puts "The dealer pulled a #{dealer_card2} and has now #{dealer_score}"
end
puts end_game_message(player_score, dealer_score)











# TODO: make the user play from terminal in a while loop that will stop
#       when the user will not be asking for  a new card

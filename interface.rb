require_relative "croupier"

puts "welcome to blackjack"



dealer_score = pick_dealer_score

player_score = pick_player_card

puts state_of_the_game(player_score, dealer_score)

puts "another card? [ y / n ]"
answer = gets.chomp


until answer == "no" || answer == "n" || player_score >= 21 do
  player_card3 = rand(1..11)
  player_score += player_card3
  puts "You pulled a #{player_card3}"
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

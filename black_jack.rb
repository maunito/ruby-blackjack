# Next step is to include a deck of 52 cards
# ends game if player draws a blackjack
# deleted unnecessary methods
# sleep function for better experience
# implement money system which iterates until money == 0
# make bets variable

# puts pulled cards aside and
# takes into account that A can be 1 or 11"

# make it possible to double bet after first 2 cards and
# game ends when player has no money left
# double bet is impossible if player has insufficient money


def player_start(values, bet, money, double)
  player_card1 = values.sample
  player_card2 = values.sample
  player_score = player_card1 + player_card2
  player_score -= 10 if player_score == 22
  puts "you have #{player_card1} and #{player_card2}"
  if $money >= 5
    puts 'Do you want to double your bet? [ y /n ]'
    double_bet = gets.chomp
    if double_bet == 'y' || double_bet == 'yes'
      $money -= bet
      puts "you bet another #{bet}$"
      $double = true
    else
      $double = false
    end
  end
  player_score
end



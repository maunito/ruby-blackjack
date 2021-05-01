# Next step is to include a deck of 52 cards
# which puts pulled cards aside and
# takes into account that A can be 1 or 11"
# ends game if player draws a blackjack
# deleted unnecessary methods
# sleep function for better experience



def player_start(values)
  player_card1 = values.sample
  player_card2 = values.sample
  player_score = player_card1 + player_card2
  player_score -= 10 if player_score == 22
  puts "you have #{player_card1} and #{player_card2}"
  return player_score
end



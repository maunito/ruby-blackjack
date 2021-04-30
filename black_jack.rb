# Next step is to include a deck of 52 cards 
# which puts pulled cards aside and 
# takes into account that A can be 1 or 11"


def pick_dealer_score(values)
 

  dealer_card1 = values.sample
  dealer_score = dealer_card1
  # dealer_score = 11 if dealer_card1 == 1
  return dealer_score
end

def player_start(values)

  player_card1 = values.sample
  player_card2 = values.sample
  player_score = player_card1 + player_card2
  player_score -= 10 if player_score == 22
  puts "you have #{player_card1} and #{player_card2}"
  return player_score
end

def player_pick_another_card(values)
  random_card = values.sample
  return random_card
end

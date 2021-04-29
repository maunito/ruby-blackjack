
cards = [1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,6,6,6,6,7,7,7,7,8,8,8,8,9,9,9,9,10,10,10,10, J, J, J, J, Q, Q, Q, Q, K, K, K, K, A, A, A, A]
J = 10
Q = 10
K = 10
A = 11

def pick_dealer_score
  dealer_card1 = rand(1..11)
  dealer_score = dealer_card1
  dealer_score = 11 if dealer_card1 == 1
  return dealer_score
end

def pick_player_card
  player_card1 = rand(1..11)
  player_card2 = rand(1..11)
  player_score = player_card1 + player_card2
  player_score -= 10 if player_score == 22
  puts "you have #{player_card1} and #{player_card2}"
  return player_score
end

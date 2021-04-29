require_relative 'black_jack'

def state_of_the_game(player_score, pick_dealer_score)
  return "Your score is #{player_score} The dealer's score is #{pick_dealer_score}."
end

def end_game_message(player_score, dealer_score)
  if player_score == 21
    return "Blackjack"
  elsif player_score > 21
    return "Over 21, you lost"
  elsif dealer_score > 21
    return "you won"
  elsif player_score == dealer_score
    return "Push"
  elsif player_score > dealer_score 
    return "You won"
  elsif player_score < dealer_score && dealer_score <= 21 
    return "You lost"
  end
end

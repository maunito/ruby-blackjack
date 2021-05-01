require_relative 'black_jack'

def sleep_and_line_break(n)
  1.upto(1) do
    puts '.'
    sleep n # second
  end
end

def state_of_the_game(player_score, pick_dealer_score)
  "Your score is #{player_score} The dealer's score is #{pick_dealer_score}."
end

def end_game_message(player_score, dealer_score)
  if player_score == 21
    'Wow! You won'
  elsif player_score > 21
    'Over 21, you lost'
  elsif dealer_score > 21
    'you won'
  elsif player_score == dealer_score
    'Push'
  elsif player_score > dealer_score 
    'You won'
  elsif player_score < dealer_score && dealer_score <= 21
    'You lost'
  end
end

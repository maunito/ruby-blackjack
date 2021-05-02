require_relative 'black_jack'


def sleep_and_line_break(n)
  1.upto(1) do
    puts '.'
    sleep n # second
  end
end

def state_of_the_game(player_score, pick_dealer_score)
  "Your score is #{player_score} - The dealer's score is #{pick_dealer_score}."
end

def end_game_message(player_score, dealer_score, money, bet)
  if player_score == 21
    if $double == true
      $money += (bet * 4) # 1 (bet) + 1.5 (blackjack) * 1 (double)
      puts "Wow! You won #{bet * 3}$ and have now #{$money}$ in your account"
    else
      $money += (bet * 2.5) # 1 (bet) + 1.5 (blackjack)
      puts "Wow! You won #{bet * 1.5}$ and have now #{$money}$ in your account"
    end
  elsif player_score > 21
    if $double == true 
      puts "Over 21, you lost #{bet *2}$ and have now #{$money}$ in your account"
    else
      puts "Over 21, you lost #{bet}$ and have now #{$money}$ in your account"
    end
  elsif dealer_score > 21
    if $double == true
      $money += (bet * 3) # 1 (bet) + 1 (win) + 1 (double)
      puts "you won #{bet * 2}$ and have now #{$money}$ in your account"
    else
      $money += (bet * 2) # 1 (bet) + 1 (win)
      puts "you won #{bet}$ and have now #{$money}$ in your account"
    end
  elsif player_score == dealer_score
    if double == true
      $money += (bet * 2) # 1 (bet) + 1 (double)
    else
      $money += bet
      puts "Push - You get your bet back (#{bet}$)"
    end
  elsif player_score > dealer_score 
    if $double == true
      $money += (bet * 3) # 1 (bet) + 1 (win) + 1 (double)
      puts "you won #{bet * 2}$ and have now #{$money}$ in your account"
    elsif
      $money += (bet * 2) # 1 (bet) + 1 (win)
      puts "you won #{bet}$ and have now #{$money}$ in your account"
    end
  elsif player_score < dealer_score && dealer_score <= 21
    if $double == true
      puts "You lost #{bet * 2}$ and have now #{$money}$ in your account"
    else
      puts "You lost #{bet}$ and have now #{$money}$ in your account"
    end
  end
  3.times do
    sleep_and_line_break(1)
  end
end

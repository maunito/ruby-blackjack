# Next step is to include a deck of 52 cards
# ends game if player draws a blackjack
# deleted unnecessary methods
# sleep function for better experience
# implement money system which iterates over game until money == 0
# make bets variable

# puts pulled cards aside and
# make it possible to double bet after first 2 cards and
# game ends when player has no money left
# double bet is impossible if player has insufficient money

# if double == true, player is not asked for a 4th card
# Player has to confirm with enter to continue
# should show 1 dealer card, then ask for double
# refactored if statements


# SECONDARY should give the oppertunity to split the cards
# TODO puts pulled cards aside and
# (1/2) takes into account that A can be 1 or 11 even consider 3 or 4 Aces"
def greeting
  puts "Welcome to Blackjack. Your balance is #{$money}$"
  puts '          press enter to play (5$)'
end


def new_game
  sleep(0.5)
  puts '----------------------------------------------'
  puts '                 NEW GAME                     '
  puts '----------------------------------------------'
end


def player_start(player_score, values, bet, dealer_score)
  player_card1 = values.sample

  player_card2 = values.sample
  player_score = player_card1 + player_card2
  if player_score == 22
    player_score -= 10 
    puts "you have 11 and 1   -   the dealer has a #{dealer_score}"
  else
    puts "you have #{player_card1} and #{player_card2}  -   the dealer has a #{dealer_score}"
  end
  gets.chomp
  if $money >= 5 && player_score < 21
    puts 'Do you want to double your bet (and draw 1 more card)? [ y / n ]'
    # puts 'Do you want to'
    # puts '1) draw another card'
    # puts '2) double bet'
    # puts '3) hold'
    double_bet = gets.chomp
    puts ""

    if double_bet == 'y' || double_bet == 'yes'
      $money -= bet
      puts "you bet another #{bet}$"
      gets.chomp
      $double = true
    else
      $double = false
    end
  end
  player_score
end

def sleep_and_line_break(n)
  1.upto(1) do
    puts ''
    sleep n # second
  end
end

def state_of_the_game(player_score, dealer_score)
  "Your score is #{player_score} - The dealer's score is #{dealer_score}."
end

def end_game_message(player_score, dealer_score, bet)
  if player_score == 21
    if $double == true
      $money += (bet * 4) # 1 (bet) + 1.5 (blackjack) * 1 (double)
      puts "Wow! You won #{bet * 4}$ and have now #{$money}$ in your account"
    else
      $money += (bet * 2.5) # 1 (bet) + 1.5 (blackjack)
      puts "Wow! You won #{bet * 2.5}$ and have now #{$money}$ in your account"
    end
  elsif player_score > 21
    if $double == true 
      puts "Over 21, you lost #{bet *2}$ and have now #{$money}$ in your account"
    else
      puts "Over 21, you lost #{bet *2}$ and have now #{$money}$ in your account"
    end
  elsif dealer_score > 21
    if $double == true
      $money += (bet * 3) # 1 (bet) + 1 (win) + 1 (double)
      puts "you won #{bet * 3}$ and have now #{$money}$ in your account"
    else
      $money += (bet * 2) # 1 (bet) + 1 (win)
      puts "you won #{bet * 2}$ and have now #{$money}$ in your account"
    end
  elsif player_score == dealer_score
    if $double == true
      $money += (bet * 2) # 1 (bet) + 1 (double)
    else
      $money += bet
      puts "Push - You get your bet back (#{bet}$)"
    end
  elsif player_score > dealer_score 
    if $double == true
      $money += (bet * 3) # 1 (bet) + 1 (win) + 1 (double)
      puts "you won #{bet * 3}$ and have now #{$money}$ in your account"
    elsif
      $money += (bet * 2) # 1 (bet) + 1 (win)
      puts "you won #{bet * 2}$ and have now #{$money}$ in your account"
    end
  elsif player_score < dealer_score && dealer_score <= 21
    if $double == true
      puts "You lost #{bet * 2}$ and have now #{$money}$ in your account"
    else
      puts "You lost #{bet * 2}$ and have now #{$money}$ in your account"
    end
  end
  gets.chomp

  sleep_and_line_break(0.2)
  
end

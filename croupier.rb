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

def new_game
  sleep(0.5)
  puts '----------------------------------------------'
  puts '                   NEW GAME                   '
  puts "min-bet: 5$                        Credit: #{$money}$"
  puts '----------------------------------------------'
end

def greeting
  puts "   Welcome to Blackjack. Your balance is #{$money}$ "
  puts '       How much do you want to bet? ($)'
end

def game_start(values, random_card)
  sleep_and_line_break(0.1)
  print "bet: "
  bet = gets.chomp.to_i
  if bet < 4.99 || $money < bet
    until bet > 4.99 && $money >= bet
      sleep_and_line_break(0.5)
      puts 'Please enter a valid number. Minimum bet is 5$'
      puts "Maximum you can afford is #{$money}."
      print 'bet: '
      bet = gets.chomp.to_i
    end
  end
  puts "you bet #{bet}$"
  sleep_and_line_break(0.5)
  $money -= bet

  dealer_score = values.sample
  player_score = player_start(values, bet, dealer_score)

  if player_score == 21
    puts 'Blackjack!'
    gets.chomp

  # elsif player_score == 22
  #   player_score = 12
  elsif player_score < 21 
    if $double == false
    puts 'another card? [ y / n ]'
    card = gets.chomp
    puts ''
    else # $double == true
      random_card = values.sample
      player_score += random_card
      puts "You pulled a #{random_card} and have now #{player_score}"
      gets.chomp
      card = 'no'
    end
  end

  until card == 'no' || card == 'n' || player_score >= 21
    # didn't work without assigning random_card again
    random_card = values.sample
    player_score += random_card
    if random_card == 11 && player_score > 21
      player_score -= 10
      puts 'You pulled an Ace'
    else
      puts "You pulled a #{random_card}"
    end
    gets.chomp
    puts state_of_the_game(player_score, dealer_score)
    sleep_and_line_break(0.5)
    if player_score < 21
      if $double == false
        puts 'another card? [ y / n ]'
        card = gets.chomp
        sleep_and_line_break(0.5)
      else
        card = 'no'
        gets.chomp
      end
    elsif player_score == 21
      puts '21!'
      gets.chomp
    end
  end
  sleep_and_line_break(0.5)
  until dealer_score >= 17
    # didn#t work with random_card
    dealer_card2 = values.sample
    # The 3 lines below is only for testing and being able to choose computer card
    # puts '[Test - choose computer card]'
    # dealer_card2 = gets.chomp.to_i
    # puts '[Test end]'
    dealer_score += dealer_card2
    if dealer_card2 == 11 && dealer_score > 21
      dealer_score -= 10
      puts "The dealer pulled an Ace and has now #{dealer_score}"
    else
      puts "The dealer pulled a #{dealer_card2} and has now #{dealer_score}"
      gets.chomp
    end
  end
  sleep_and_line_break(0.5)
  end_game_message(player_score, dealer_score, bet)
end

def player_start(values, bet, dealer_score)
  player_card1 = values.sample
  player_card2 = values.sample
  player_score = player_card1 + player_card2
  if player_score == 22
    player_score -= 10
    puts "you have 11 and 1   -   the dealer has a #{dealer_score}"
  else
    puts "you have #{player_card1} and #{player_card2}  -  the dealer has a #{dealer_score}"
  end
  gets.chomp
  if $money >= bet && player_score < 21
    puts 'Do you want to double your bet (and draw 1 card)? [ y / n ]'
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
  else
    $double = false
  end
  player_score # is a variable, no method
end

def state_of_the_game(player_score, dealer_score)
  "Your score is #{player_score} - The dealer's score is #{dealer_score}."
end

def sleep_and_line_break(n)
  1.upto(1) do
    puts ''
    sleep n # second
  end
end

def end_game_message(player_score, dealer_score, bet)
  won = false
  if player_score == 21 && dealer_score != 21
    if $double == true
      $money += (bet * 4) # 1 (bet) + 1.5 (blackjack) * 1 (double)
      puts "Wow! You won #{bet * 4}$ and have now #{$money}$ in your account"
    else
      $money += (bet * 2.5) # 1 (bet) + 1.5 (blackjack)
      puts "Wow! You won #{bet * 2.5}$ and have now #{$money}$ in your account"
    end
    won = true
  elsif player_score > 21
    if $double == true 
      puts "Over 21, you lost #{bet * 2}$ and have now #{$money}$ in your account"
    else
      puts "Over 21, you lost #{bet}$ and have now #{$money}$ in your account"
    end
    won = false
  elsif dealer_score > 21
    if $double == true
      $money += (bet * 4) # 2 (bet) + 1 (win) + 1 (double)
      puts "you won #{bet * 4}$ and have now #{$money}$ in your account"
    else
      $money += (bet * 2) # 1 (bet) + 1 (win)
      puts "you won #{bet * 2}$ and have now #{$money}$ in your account"
    end
    won = true
  elsif player_score == dealer_score
    if $double == true
      $money += (bet * 2) # 1 (bet) + 1 (double)
      puts "Push - You get your bet back (#{bet * 2}$)"
    else
      $money += bet
      puts "Push - You get your bet back (#{bet}$)"
    end
    won = nil
  elsif player_score > dealer_score
    if $double == true
      $money += (bet * 4) # 2 (bet) + 1 (win) + 1 (double)
      puts "you won #{bet * 4}$ and have now #{$money}$ in your account"
    else
      $money += (bet * 2) # 1 (bet) + 1 (win)
      puts "you won #{bet * 2}$ and have now #{$money}$ in your account"
    end
    won = true
  elsif player_score < dealer_score && dealer_score <= 21
    if $double == true
      puts "You lost #{bet * 2}$ and have now #{$money}$ in your account"
    else
      puts "You lost #{bet}$ and have now #{$money}$ in your account"
    end
    won = false
  end
  sleep_and_line_break(0.5)

  if $money < 5
    game_over
  elsif won == true
    you_won
  elsif won == false
    you_lost
  else # won == nil (push)
    you_pushed
  end
  gets.chomp

end

def you_won
  puts '----------------------------------------------'
  puts '                   YOU WON                    '
  puts '----------------------------------------------'
end

def you_lost
  puts '----------------------------------------------'
  puts '                  YOU LOST                    '
  puts '----------------------------------------------'
end

def you_pushed
  puts '----------------------------------------------'
  puts '                   PUSH                       '
  puts '----------------------------------------------'
end

def game_over
  if $money < 5
    puts '----------------------------------------------'
    puts '                GAME OVER                     '
    puts '----------------------------------------------'
  end
end

require_relative 'croupier'

$money = 20
bet = 5
$double = false

J = 10
Q = 10
K = 10
A = 11

values = [2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K, A]

random_card = values.sample

until $money <= 4.99 do
  new_game
  puts "Welcome to Blackjack. Your balance is #{$money}$"
  puts 'press enter to play (5$)'

  game_start = gets.chomp
  if game_start != "haahsjkfn"
    $money -= bet

    dealer_score = values.sample
    player_score = player_start(values, bet)

    puts state_of_the_game(player_score, dealer_score)

    if player_score == 21
      puts 'Blackjack!'
      gets.chomp

    # elsif player_score == 22
    #   player_score = 12
    elsif player_score < 21 
      if $double == false
      puts 'another card? [ y / n ]'
      card = gets.chomp
      puts ""
      else # $double == true
        player_score += random_card
        puts "You pulled a #{random_card}"
        sleep_and_line_break(1)
        gets.chomp
        card = 'no'
        sleep_and_line_break(0.5)
      end
    end

    until card == 'no' || card == 'n' || player_score >= 21
      player_score += random_card
      puts "You pulled a #{random_card}"
      sleep_and_line_break(1)
      puts state_of_the_game(player_score, dealer_score)
      gets.chomp
      if player_score < 21 
        if $double == false
          puts 'another card? [ y / n ]'
          card = gets.chomp
        else
          card == 'no'
        end
      elsif player_score == 21
        '21!'
        gets.chomp
      end
    end

    until dealer_score >= 17
      (dealer_card2 = values.sample)
      dealer_score += dealer_card2
      puts "The dealer pulled a #{dealer_card2} and has now #{dealer_score}"
      sleep_and_line_break(2)
    end
    
    end_game_message(player_score, dealer_score, bet)
    new_game
  end
end

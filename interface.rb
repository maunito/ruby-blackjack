require_relative 'croupier'

$money = 50
bet = 5
$double = false

J = 10
Q = 10
K = 10
A = 11

values = [2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K, A]

until $money <= 4.99 do
  2.times do
    new_game
  end
  puts "Welcome to Blackjack. Your balance is #{$money}$"
  puts 'press enter to play (5$)'
  game_start = gets.chomp
  if game_start != "haahsjkfn"
    $money -= bet
    sleep_and_line_break(0.5)

    dealer_score = values.sample

    player_score = player_start(values, bet)
    sleep_and_line_break(0.5)

    puts state_of_the_game(player_score, dealer_score)
    
    sleep_and_line_break(0.5)

    if player_score == 21
      puts
      '---- --
       ||   ---
       ||  ---
       ||------
       ||    ---
       ||     --
        - --- -'

    # elsif player_score == 22
    #   player_score = 12
    elsif player_score < 21
      if $double == false
        puts 'another card? [ y / n ]'
        sleep_and_line_break(0.5)
        answer = gets.chomp
      else # $double == true
        answer = 'no'
      end

      sleep_and_line_break(0.5)

      until answer == 'no' || answer == 'n' || player_score >= 21 ||
        random_card = values.sample
        player_score += random_card
        puts "You pulled a #{random_card}"
        sleep_and_line_break(0.5)
        puts state_of_the_game(player_score, dealer_score)
        sleep_and_line_break(0.5)
        if player_score < 21 && $double == false
          puts 'another card? [ y / n ]'
          answer = gets.chomp
          sleep_and_line_break(0.5)
        elsif player_score == 21
          '21!'
          sleep_and_line_break(0.5)
        else
          answer == 'no'
        end
      end
    end

    until dealer_score >= 17
      (dealer_card2 = values.sample)
      dealer_score += dealer_card2
      puts "The dealer pulled a #{dealer_card2} and has now #{dealer_score}"
      sleep_and_line_break(0.5)
    end


    end_game_message(player_score, dealer_score, $money, bet)
  end
end
require_relative 'croupier'
require_relative 'black_jack'
money = 50
bet = 5

J = 10
Q = 10
K = 10
A = 11

values = [2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K, A]

until money <= 0 do
  puts "Welcome to Blackjack. Your balance is #{money}$"
  puts 'press enter to play (5$)'
  game_start = gets.chomp
  if game_start != "haahsjkfn"
    money -= bet
    sleep_and_line_break(0.5)

    dealer_score = values.sample

    player_score = player_start(values)
    sleep_and_line_break(0.5)

    puts state_of_the_game(player_score, dealer_score)
    sleep_and_line_break(0.5)

    if player_score == 21
      puts 'Blackjack!'
    elsif player_score < 21
      puts 'another card? [ y / n ]'
      sleep_and_line_break(0.5)
      answer = gets.chomp
      sleep_and_line_break(0.5)
      until answer == 'no' || answer == 'n' || player_score >= 21 
        random_card = values.sample
        player_score += random_card
        puts "You pulled a #{random_card}"
        sleep_and_line_break(0.5)
        puts state_of_the_game(player_score, dealer_score)
        sleep_and_line_break(0.5)
        if player_score < 21
          puts 'another card? [ y / n ]'
          sleep_and_line_break(0.5)
          answer = gets.chomp
          sleep_and_line_break(0.5)
        elsif player_score == 21
          '21!'
          sleep_and_line_break(0.5)
        end
      end
    end

    until dealer_score >= 17
      (dealer_card2 = values.sample)
      dealer_score += dealer_card2
      puts "The dealer pulled a #{dealer_card2} and has now #{dealer_score}"
      sleep_and_line_break(0.5)
    end


    puts end_game_message(player_score, dealer_score, money, bet)
  end
end
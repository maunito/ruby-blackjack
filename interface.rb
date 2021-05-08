require_relative 'croupier'

$money = 50
$double = false

J = 10
Q = 10
K = 10
A = 11

values = [2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K, A]

random_card = values.sample

until $money <= 4.99 do
  system("clear") # nice function which clears terminal history to differentiate game sessions.
  sleep_and_line_break(0.1)
  new_game # function to display new game banner
  greeting # welcome message and prompt user to start game
  gets.chomp # palyer has to hit enter to continue
  game_start(values, random_card) # game start function
end

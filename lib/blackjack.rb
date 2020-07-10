require 'pry'

def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(1..11)
end

def display_card_total(number)
  puts "Your cards add up to #{number}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end

def end_game(number)
  puts "Sorry, you hit #{number}. Thanks for playing!"
end

def initial_round
  sum = deal_card() + deal_card()
  display_card_total(sum)
  sum
end

def invalid_command
  puts "Please enter a valid command"
end

def hit?(card_total)
  prompt_user()
  input = get_user_input()
  if input == 'h'
    new_card = deal_card()
    card_total += new_card
  elsif input == 's' 
    nil
  else
    invalid_command
    prompt_user()
    get_user_input()
  end
  card_total
end

def runner
  welcome()
  card_total = initial_round()
  until card_total > 21 do
    card_total = hit?(card_total)
    display_card_total(card_total)
  end
  end_game(card_total)
end


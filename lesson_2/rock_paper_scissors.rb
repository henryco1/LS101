=begin
Rock paper scissors game
=end

VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts("=> #{message}")
end

def display_results(player, computer) 
  if (player == 'rock' && computer == 'scissors') ||
      (player == 'paper' && computer == 'rock') ||
      (player == 'scissors' && computer == 'paper') 
    prompt("You won!")
  elsif (player == computer)
    prompt("It is a tie!")
  else
    prompt("The computer won!")
  end
end

prompt("Welcome to Rock Paper Scissors!")
loop do
  choice = ''
  loop do 
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("Input a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice} and the computer chose #{computer_choice}")

  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  again = Kernel.gets().chomp()
  break unless again.downcase().start_with?('y')
end

prompt("Thanks for playing!")

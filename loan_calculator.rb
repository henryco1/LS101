=begin
This program will calculator the monthly payment on a mortage/loan. The value
is calculated by the following formuala:
  m = p * (j / (1 - (1 + j)**(-n)))

p = loan amount
j = monthly interest rate percentage
n = loan duration in months

Example input
p = 10000
j = 5%
n = 12
monthly payment is 1128.25

Steps:
Get values from user and plug in the values from the user while the
values are valid. Ask the user if they want to input values again.
=end

def prompt(message)
  puts("=> #{message}")
end

def valid_num?(input)
  integer?(input) || float?(input)
end

def integer?(input)
  Integer(input) rescue false
end

def float?(input)
  Float(input) rescue false
end

loan_amount = 0
interest = 0
duration_months = 0

prompt("Welcome to Loan Calculator.")

loop do
  loop do
    prompt("Enter the loan amount: ")
    loan_amount = gets.chomp
    if !valid_num?(loan_amount)
      prompt("Error: invalid input entered")
    elsif loan_amount.to_i <= 0
      prompt("The loan amount must be greater than 0")
    else
      loan_amount = loan_amount.to_f
      break
    end
  end

  loop do
    prompt("Enter the monthly interest rate percentage: ")
    interest = gets.chomp
    if valid_num?(interest)
      interest = interest.to_f / 100
      break
    else
      prompt("Error: invalid input entered")
    end
  end

  loop do
    prompt("Enter the duration of the loan in months: ")
    duration_months = gets.chomp
    if !valid_num?(duration_months)
      prompt("Error: invalid input entered")
    elsif duration_months.to_i <= 0
      prompt("The month duration must be greater than 0")
    else
      duration_months = duration_months.to_i
      break
    end
  end

  if interest > 0
    res = loan_amount * (interest / (1 - (1 + interest)**(-duration_months)))
  else
    res = loan_amount / duration_months
  end
  puts ("Your monthly payment is $#{format('%02.2f', res)}")

  prompt("Calculate your monthly payment again? (enter y for yes)")
  continue = gets.chomp
  break unless continue.downcase == 'y'

  prompt("Thank you for using loan calculator! Goodbyte!")
end

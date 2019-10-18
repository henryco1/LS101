def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_num?(input)
  input.to_i() != 0
end

def operator_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to Calculator. Enter your name.")

username = ''
loop do
  username = gets().chomp()
  if username.empty?()
    prompt("Please enter a valid name.")
  else
    break
  end
end

loop do
  num1 = ''
  num2 = ''

  loop do
    prompt("What is the first number?")
    num1 = Kernel.gets().chomp()

    if valid_num?(num1)
      break
    else
      prompt("Invalid num")
    end
  end

  loop do
    prompt("What is the second number?")
    num2 = Kernel.gets().chomp()

    if valid_num?(num2)
      break
    else
      prompt("Invalid num")
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG
  prompt(operator_prompt)
  operator = ''

  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must enter 1, 2, 3, or 4")
    end
  end

  prompt("#{operator_to_message(operator)} the two numbers...")
  result =  case operator
            when "1"
              num1.to_i + num2.to_i
            when "2"
              num1.to_i - num2.to_i
            when "3"
              num1.to_i * num2.to_i
            when "4"
              puts "Error: cannot divide by 0" if num2.to_f == 0
              num1.to_f / num2.to_f
            end

  prompt("The result is #{result}")

  prompt("Do you want to calculate again? (Y to calculate again)")
  answer = gets().chomp()

  if answer.upcase() != 'Y'
    prompt("Thank you for using my calculator")
    break
  end
end

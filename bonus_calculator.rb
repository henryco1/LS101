require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

# Nums that are strings are not considered valid nums
def valid_num?(input)
  integer?(input) || float?(input)
end

def integer?(input)
  Integer(input) rescue false
end

def float?(input)
  Float(input) rescue false
end

# an operation selector with a string output based on a numeric input
def operator_to_message(op)
  msg = case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
  msg
end

# This loop gets a name, two numbers, and a numeric option representing
# arithmetic operations as input. Given the number and operation inputs,
# a result is calculated.
prompt(MESSAGES['welcome'])
username = ''
loop do
  username = gets().chomp()
  if username.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

loop do
  num1 = ''
  num2 = ''

  loop do
    prompt(MESSAGES['first_num'])
    num1 = Kernel.gets().chomp()

    if valid_num?(num1)
      break
    else
      prompt(MESSAGES['invalid_num'])
    end
  end

  loop do
    prompt(MESSAGES['second_num'])
    num2 = Kernel.gets().chomp()

    if valid_num?(num2)
      break
    else
      prompt(MESSAGES['invalid_num'])
    end
  end

  prompt(MESSAGES['operator_num_prompt'])
  operator = ''

  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['correct_operator'])
    end
  end

  divByZeroError = false
  prompt("#{operator_to_message(operator)} " + MESSAGES['two_nums'])
  result =  case operator
            when "1"
              num1.to_f + num2.to_f
            when "2"
              num1.to_f - num2.to_f
            when "3"
              num1.to_f * num2.to_f
            when "4"
              if num2.to_f == 0
                prompt MESSAGES['div_zero_error'] if num2.to_f == 0
                divByZeroError = true
                next
              end
              num1.to_f / num2.to_f
            end

  prompt(MESSAGES['result_is'] + "#{result}") unless divByZeroError == true

  prompt(MESSAGES['again'])
  answer = gets().chomp()

  if answer.upcase() != 'Y'
    prompt(MESSAGES['thanks'])
    break
  end
end

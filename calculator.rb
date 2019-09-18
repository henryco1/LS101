# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

Kernel.puts("Welcome to Calculator")

Kernel.puts("What is the first number?")
num1 = Kernel.gets().chomp()

Kernel.puts("What is the second number?")
num2 = Kernel.gets().chomp()

Kernel.puts("What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide")
operator = Kernel.gets().chomp()

if operator == "1"
  result = num1.to_i + num2.to_i
elsif operator == "2"
  result = num1.to_i - num2.to_i  
elsif operator == "3"
  result = num1.to_i * num2.to_i  
elsif operator == "4"
  puts "Error: cannot divide by 0" if num2.to_f == 0
  result = num1.to_f / num2.to_f  
end

Kernel.puts("The result is #{result}")
# Kernel.puts(num1.inspect())
# Kernel.puts("the number is " + num1 + "!")
# Kernel.puts(num2.inspect())
# Kernel.puts("the number is " + num2 + "!")
def input_students
  puts "Enter the name of the students"
  puts "Press enter twice to exit"

  # Create empty array
  students = []

  # Get input from user
  input = gets.chomp
  
  # Check if input is empty - if it is, return the array
  while !input.empty? do
    # Add student to array
    students << {name: input, cohort: :November}

    # Print the number of students
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    
    # Get a new input
    input = gets.chomp
  end

  return students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "".center(50, "-")
end

def print(students)
  students.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]}: #{student[:cohort]} cohort".center(50)
  end
end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have #{students.count} great student!".center(50)
  else
    puts "Overall, we have #{students.count} great students!".center(50)
  end
end

# Call methods to run program
students = input_students()
print_header
print(students)
print_footer(students)
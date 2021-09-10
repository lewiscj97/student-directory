def input_students
  puts "Enter the name of the student, followed by their cohort"
  puts "Press enter twice to exit"

  # Create empty array
  students = []

  # Get input from user
  name, cohort = get_user_input
  
  # Check if input is empty - if it is, return the array
  while !name.empty? do
    # Add student to array
    cohort.empty? ? (students << {name: name, cohort: :November}) : (students << {name: name, cohort: cohort.capitalize.to_sym})

    # Print the number of students
    students.count == 1 ? (puts "Now we have #{students.count} student") : (puts "Now we have #{students.count} students")
    
    name, cohort = get_user_input
  end

  return students
end

def print_header
  puts "".center(50, "-")
  puts "The students of Villains Academy".center(50)
  puts "".center(50, "-")
end

def get_user_input
  print("Name: ")
  name = gets.chomp
  print("Cohort: ")
  cohort = gets.chomp
  return name, cohort
end

def print_students(students)
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
print_students(students)
print_footer(students)
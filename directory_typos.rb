ERROR_MESSAGE = "I don't know what you mean, try again!"
@students = []

def interactive_menu
  loop do
    print_menu
    process(get_input)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    print_output
  when "3"
    save_students
  when "9"
    exit
  else
    puts ERROR_MESSAGE
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the students to students.csv"
  puts "9. Exit"
end

def get_input
  print "Enter your option: "
  selection = gets.chomp
end

def print_output()
  print_header()
  print_students()
  print_footer()
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = gets.chomp
  end
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_students()
  @students.each do |student|
    puts "#{student[:name]}: #{student[:cohort]} cohort"
  end
end

def print_footer()
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  # Open a new csv file called students.csv in write mode
  file = File.open("students.csv", "w")
  # iterate through the students array
  @students.each do |student|
    # Create a new array with the student name and cohort
    student_data = [student[:name], student[:cohort]]
    # Join the data into a string with a comma delimiter
    csv_line = student_data.join(", ")
    # Writes the string to the file
    file.puts csv_line
  end
  # Close the file
  file.close
end

interactive_menu()
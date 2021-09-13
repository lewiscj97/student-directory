ERROR_MESSAGE = "I don't know what you mean, try again!"
@students = []

def interactive_menu
  try_load_students
  loop do
    print_menu
    process(get_input)
  end
end

def process(selection)
  case selection
  when "1"
    puts "Selected option 1. Inputting students..."
    input_students
    puts "Finished inputting students..."
  when "2"
    puts "Selected option 2. Showing students..."
    print_output
    puts "Finished showing students..."
  when "3"
    puts "Selected option 3. Saving students..."
    save_students
    puts "Finished saving students..."
  when "4"
    puts "Selected option 4. Loading students..."
    load_students
  when "9"
    exit
  else
    puts ERROR_MESSAGE
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the students"
  puts "4. Load the students from students.csv"
  puts "9. Exit"
end

def get_input
  print "Enter your option: "
  selection = STDIN.gets.chomp
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
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    add_hash_to_students_instance(name)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
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
  print "Enter filename (without .csv) - leave blank for default: "
  filename = gets.chomp
  if filename.empty?
    filename = "students.csv"
  else
    filename = filename + ".csv"
  end
  # Open a new csv file called students.csv in write mode
  file = File.open(filename, "w")
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

def load_students(filename = "students.csv")
  # Open in read mode
  file = File.open(filename, "r")
  # Read each line into an array and iterate over the array with eaech
  file.readlines.each do |line|
    # The array is a string e.g. "Lewis, november". Remove any \n etc with chomp and split at the comma and save into variables
    name, cohort = line.chomp.split(", ")
    # Add the hash to the students instance variable
    add_hash_to_students_instance(name, cohort)
  end
  # Close the file
  file.close
  puts "Loaded #{@students.count} students from #{filename}"
end

def add_hash_to_students_instance(name, cohort = :november)
  @students << {name: name, cohort: cohort.to_sym}
end

def try_load_students
  filename = ARGV.first
  if filename.nil? && File.exists?("students.csv")
    load_students
  elsif filename.nil?
    return
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} students from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

interactive_menu()
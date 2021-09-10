students = [
  "Hannibal Lecter",
  "Darth Vadar",
  "Terminator"
]

def print_header
  puts "The students of Villains Academy"
  puts "-------------------"
end

def print(students)
  students.each do |student|
    puts student
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students!"
end

# Call methods to run program
print_header
print(students)
print_footer(students)
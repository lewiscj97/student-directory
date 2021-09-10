# Array of students
students = [
  "Hannibal Lecter",
  "Darth Vadar",
  "Terminator"
]
student_count = students.count

# Print list of students
puts "The students of Villains Academy"
puts "-------------------"
students.each do |student|
  puts student
end

# Print total number of students
puts "Overall, we have #{student_count} great students!"
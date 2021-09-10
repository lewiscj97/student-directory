def input_students
  puts "Enter the name of the student, followed by their cohort"
  puts "Press enter twice to exit"

  students = []
  name, cohort = get_user_input
  
  while !name.empty? do
    # If cohort empty, default to ':November'
    # Otherwise, add the hash to the students array
    cohort.empty? ? (students << {name: name, cohort: :November}) : (students << {name: name, cohort: cohort.capitalize.to_sym})

    # Print appropraite message based on count of students
    students.count == 1 ? (puts "Now we have #{students.count} student") : (puts "Now we have #{students.count} students")
    
    # Loop
    name, cohort = get_user_input
  end

  return students
end

def print_header(students)
  if !students.empty?
    puts "".center(50, "-")
    puts "The students of Villains Academy".center(50)
    puts "".center(50, "-")
  end
end

def get_user_input
  print("Name: ")
  name = gets.chomp
  print("Cohort: ")
  cohort = gets.chomp
  return name, cohort
end

def print_students(students)
  if !students.empty?
    students.each.with_index(1) do |student, index|
      puts "#{index}. #{student[:name]}: #{student[:cohort]} cohort".center(50)
    end
  end
end

def print_students_by_cohort(students)
  hash = collect_students_into_hash(students)
  hash.each do |cohort, students|
    puts "#{cohort.to_s} Cohort".center(50)
    students.each.with_index(1) do |student, index|
      puts "#{index}. #{student}".center(50)
    end
  end
end

def collect_students_into_hash(students)
  hash = {}
  students.each do |student|
    if !hash.key?(student[:cohort]) 
      hash[student[:cohort]] = [student[:name]]
    else
      hash[student[:cohort]].push(student[:name])
    end
  end
  hash
end

def print_footer(students)
  if !students.empty?
    if students.count == 1
      puts "Overall, we have #{students.count} great student!".center(50)
    else
      puts "Overall, we have #{students.count} great students!".center(50)
    end
  end
end

def main(cohort = "n")
  if cohort != "n" && cohort != "y"
    puts "You must enter either 'y', 'n' or leave this blank"
  else
    students = input_students()
    print_header(students)
    if cohort == "n"
      print_students(students)
    elsif cohort == "y"
      print_students_by_cohort(students)
    end
    print_footer(students)  
  end
end

main("y")
# student-directory

The student directory script allows you to manage the list of enrolled students.

## How to use

```shell
ruby directory_final.rb

ruby directory_final.rb <filename>
```

If no filename is passed on startup, by default the program will attempt to load a file called 'students.csv' into the in-memory database.

Passing the filename on startup will cause the program to attempt to load student information from the file into the in-memory database. The interactive menu is subsequently launched.

If no file is found, the program exits.

## Interactive menu options:

* 1: Input students

This launches an interface where the students name is added to the in-memory database.

* 2: Show the students

This shows in the terminal the current students in the database.

* 3: Save the students to students.csv

This saves any students in the in-memory database to the students.csv file.

* 4: Load the students from students.csv

This loads the data manually from students.csv. This is useful if a database already exists, but it wasn't loaded on startup.


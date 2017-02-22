require_relative('../models/student')
require('pry')

@student1 = Student.new ({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house" => "Gryffindor",
  "age" => 10
  })
@student2 = Student.new ({
  "first_name" => "Draco",
  "last_name" => "Malfoy",
  "house" => "Slytherin",
  "age" => 11
  })
@student3 = Student.new ({
  "first_name" => "Hermione",
  "last_name" => "Granger",
  "house" => "Gryffindor",
  "age" => 12
  })
@student4 = Student.new ({
  "first_name" => "Richard",
  "last_name" => "Croft",
  "house" => "Hufflepuff",
  "age" => 18
  })

@student1.save
@student2.save
@student3.save
@student4.save

binding.pry

nil
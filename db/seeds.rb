require_relative('../models/student')
require_relative('../models/house')
require('pry')

Student.delete_all
House.delete_all





@house1 = House.new ({
  "name" => "Hufflepuff"
  })
@house2 = House.new ({
  "name" => "Slytherin"
  })
@house3 = House.new ({
  "name" => "Ravenclaw"
  })
@house4 = House.new ({
  "name" => "Gryffindor"
  })
@house1.save
@house2.save
@house3.save
@house4.save

@student1 = Student.new ({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house_id" => @house4.id,
  "age" => 10
  })
@student2 = Student.new ({
  "first_name" => "Draco",
  "last_name" => "Malfoy",
  "house_id" => @house2.id,
  "age" => 11
  })
@student3 = Student.new ({
  "first_name" => "Hermione",
  "last_name" => "Granger",
  "house_id" => @house4.id,
  "age" => 12
  })
@student4 = Student.new ({
  "first_name" => "Richard",
  "last_name" => "Croft",
  "house_id" => @house3.id,
  "age" => 18
  })
@student1.save
@student2.save
@student3.save
@student4.save



binding.pry

nil
require_relative('../db/sql_runner.rb')

class Student




  attr_reader :id
  attr_accessor :first_name, :last_name, :house, :age

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house = options['house']
    @age = options['age'].to_i
  end

  def save
    sql = "INSERT INTO students (first_name, last_name, house, age) VALUES ( '#{@first_name}', '#{@last_name}', '#{@house}' , '#{@age}') RETURNING *;"
    @id = SqlRunner.run(sql).first()['id'].to_i
  end 

end
require_relative('../db/sql_runner.rb')


class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :house_id, :age

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
    @house_id = options['house_id'].to_i if options['house_id']
  end

  def save
    sql = "INSERT INTO students (first_name, last_name, house_id, age) VALUES ( '#{@first_name}', '#{@last_name}', '#{@house_id}' , '#{@age}') RETURNING *;"
    @id = SqlRunner.run(sql).first['id'].to_i
  end 

  def update()
    sql = "UPDATE students SET
      (first_name, last_name, house_id, age
      )=( 
      '#{ @first_name }',
        '#{ @last_name }',
      '#{ @house_id }', '#{@age}')
      WHERE id = #{ @id };"
    SqlRunner.run( sql )
  end

  def delete()
    sql = "DELETE FROM students WHERE id=#{ @id };"
    SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM students;"
    students = SqlRunner.run( sql )
    result = students.map { |student| Student.new( student ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM students WHERE id=#{@id};"
    student = SqlRunner.run( sql )
    result = Student.new( student.first )
    return result
  end

  def self.delete_all
    sql = "DELETE FROM students;"
    SqlRunner.run(sql)
  end

  def house()
    sql = "SELECT * FROM houses WHERE id = #{@house_id}"
   result=SqlRunner.run(sql).first
   return House.new(result).name
  end

end
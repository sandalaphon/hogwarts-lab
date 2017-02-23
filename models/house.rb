require_relative('../db/sql_runner.rb')

class House

attr_reader :id
attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end  

  def save
    sql = "INSERT INTO houses (name) VALUES ( '#{@name}') RETURNING *;"
    @id = SqlRunner.run(sql).first['id'].to_i
  end 

  def update()
    sql = "UPDATE houses SET
      (name) = ('#{ @name }')
      WHERE id = #{ @id };"
    SqlRunner.run( sql )
  end

  def delete()
    sql = "DELETE FROM houses WHERE id=#{ @id };"
    SqlRunner.run( sql )
  end

def students()
  sql = "SELECT * FROM students WHERE house_id = #{ @id }"
      results = SqlRunner.run(sql)
      students_array = results.map{|student| Student.new(student)}
      return students_array
    end

  def self.all()
    sql = "SELECT * FROM houses;"
    houses = SqlRunner.run( sql )
    result = houses.map { |house| House.new( house ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM houses WHERE id=#{id};"
    houses = SqlRunner.run( sql )
    result = House.new( houses.first )
    return result
  end

  def self.delete_all
    sql = "DELETE FROM houses;"
    SqlRunner.run(sql)
  end

end
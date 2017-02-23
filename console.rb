require('pry')
require_relative('./models/student.rb')
require_relative('./models/house.rb')
require_relative('db/sql_runner.rb')
require('sinatra')
require('sinatra/contrib/all')

get '/students' do
  @students = Student.all
  erb(:index)
end

get '/students/new' do
  @houses=House.all
erb(:new)
end

post '/students' do 
@student = Student.new(params)
@student.save
redirect '/students'
end



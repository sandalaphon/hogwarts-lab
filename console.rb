require('pry')
require_relative('models/student.rb')
require_relative('db/sql_runner.rb')
require('sinatra')
require('sinatra/contrib/all')

get '/students' do
  @students = Student.all
  erb(:index)
end






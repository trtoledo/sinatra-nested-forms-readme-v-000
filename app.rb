require_relative 'config/environment'
require_relative 'models/student.rb'
require_relative 'models/course.rb'

class App < Sinatra::Base
  get '/' do
    erb :new
  end

  post '/student' do
  @student = Student.new(params[:student])

  params[:student][:courses].each do |details|
    Course.new(details)
  end

  @courses = Course.all

  erb :student
  end
end

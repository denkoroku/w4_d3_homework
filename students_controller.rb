require('sinatra')
require('sinatra/reloader')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')

# index
get '/students'do
  @students = Student.all
  erb(:index)
end

# new
get '/students/new' do
  @houses = House.all
  erb(:new)
end

# show
get '/students/:id' do
  @houses = House.all
  @students = Student.find(params[:id])
  erb(:show)
end

# create
post '/students' do
  Student.new(params).save
  erb(:new)
end

# edit
get '/students/:id/edit' do
  @students = Student.find(params[:id])
  erb(:edit)
end

# update
put '/students/:id' do
  Student.new(params).update
  redirect '/students'
end

# destroy
delete '/students/:id'do
  student = Student.find(params['id'])
  student.delete
  redirect '/students'
end

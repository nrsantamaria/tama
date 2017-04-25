require 'sinatra'
require 'sinatra/reloader'
require './lib/tama'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  @my_tamas = Tama.all()
  erb(:index)
end

post('/name') do
  input_name = params.fetch('name')
  Tama.clear
  Tama.new(input_name)
  redirect('/')
end

post('/feed') do
  @my_tamas = Tama.all()
  @my_tamas[0].feed()
  redirect('/')
end

post('/sleep') do
  @my_tamas = Tama.all()
  @my_tamas[0].sleep()
  redirect('/')
end

post('/play') do
  @my_tamas = Tama.all()
  @my_tamas[0].play()
  redirect('/')
end

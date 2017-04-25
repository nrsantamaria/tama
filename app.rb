require 'sinatra'
require 'sinatra/reloader'
require './lib/tama'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/output') do
  @my_tamas = Tama.all()
  erb(:output)
end

post('/name') do
  input_name = params.fetch('name')
  Tama.clear
  Tama.new(input_name)
  redirect('/output')
end

post('/feed') do
  @my_tamas = Tama.all()
  @my_tamas[0].feed()
  redirect('/output')
end

post('/sleep') do
  @my_tamas = Tama.all()
  @my_tamas[0].sleep()
  redirect('/output')
end

post('/play') do
  @my_tamas = Tama.all()
  @my_tamas[0].play()
  redirect('/output')
end

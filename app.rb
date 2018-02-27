require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/survey")
require("./lib/question")
require("pg")

get('/') do
  @surveys = Survey.all
  erb(:index)
end

post('/surveys') do
  title = params['title']
  @survey = Survey.new({:title => title})
  @survey.save
  erb(:success)
end

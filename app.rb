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

get('/surveys/:id/edit') do
  @survey = Survey.find(params['id'].to_i)
  erb(:survey_edit)
end

patch('/surveys/:id') do
  title = params['title']
  @survey = Survey.find(params['id'].to_i)
  @survey.update({:title => title})
  @surveys = Survey.all
  erb(:index)
end

delete('/surveys/:id') do
  @survey = Survey.find(params['id'].to_i)
  @survey.destroy
  @surveys = Survey.all
  erb(:index)
end

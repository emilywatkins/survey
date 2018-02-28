require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @surveys = Survey.all
  erb(:index)
end

post('/surveys') do
  title = params['title']
  @survey = Survey.create({:title => title})
  erb(:success)
end

get('/surveys/:id/edit') do
  @survey = Survey.find(params['id'].to_i)
  erb(:survey_edit)
end

get('/surveys/:id') do
  @survey = Survey.find(params['id'].to_i)
  @questions = Question.all
  erb(:survey)
end

post('/surveys/:id') do
  @survey = Survey.find(params['id'].to_i)
  question = params['question']
  survey_id = params['survey_id']
  @question = Question.create({:question => question, :survey_id => survey_id})
  @questions = Question.all
  erb(:survey)
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

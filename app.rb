require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/def')

get('/') do
  @words = Word.all()
  erb(:index)
end

post('/words') do
  word = params.fetch('word')
  Word.new({:word => word}).save()
  @words = Word.all()
  erb(:index)
end

post('/definitions') do
  word_def = params.fetch('def')
  definition = Definition.new({:def => word_def})
  definition.save
  @word = Word.find(params.fetch('definitions').to_i())
  @word.add_def(definition)
  erb(:word)
end

get('/definitions/:id') do
  @definition = Definition.find(params.fetch('id').to_i())
  erb(:definition)
end

get('/words/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

get("/clear") do
  Word.clear()
  redirect(:/)
end

require("bundler/setup")
Bundler.require(:default)
require("pry")

ENV['RACK_ENV'] = 'test'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
#Home page
get('/') do
  @stores = Store.all()
  erb(:index)
end
#add new store
get('/stores/new') do
  erb(:store_form)
end
#post new store
post('/stores/new') do
  name = params.fetch('name')
  store = Store.create({:name => name})
  redirect('/')
end
#view individual store
get('/stores/view/:id')do
  store_id = params.fetch('id').to_i()
  @store = Store.find(store_id)
  erb(:store)
end

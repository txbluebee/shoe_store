require("bundler/setup")
Bundler.require(:default)
require("pry")

ENV['RACK_ENV'] = 'test'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @stores = Store.all()
  erb(:index)
end

get('/') do

end

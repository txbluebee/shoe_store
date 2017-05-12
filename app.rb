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
  @new_store = Store.new({:name => name})
  if @new_store.save()
    redirect('/')
  else
    erb(:store_form)
  end
end
#view individual store
get('/stores/view/:id') do
  store_id = params.fetch('id').to_i()
  @store = Store.find(store_id)
  @brands = Brand.all()
  erb(:store)
end

#edit individual store
get('/stores/view/:id/edit') do
  store_id = params.fetch('id').to_i()
  @store = Store.find(store_id)
  @brands = Brand.all()
  erb(:store_edit_form)
end

patch('/stores/view/:id/edit/name') do
  store_id = params.fetch('id').to_i()
  @store = Store.find(store_id)
  name = params.fetch('name')
  @store.update({:name => name})
  redirect('/stores/view/'.concat(store_id.to_s()))
end

patch('/stores/view/:id/edit/brand') do
  store_id = params.fetch('id').to_i()
  @store = Store.find(store_id)
  brand_ids = params.fetch('brand_ids')
  brand_ids.each() do |brand_id|
    brand = Brand.find(brand_id)
    @store.brands.push(brand)
  end
  redirect('/stores/view/'.concat(store_id.to_s()))
end

#view all brands
get('/brands') do
  @brands = Brand.all()
  erb(:brands)
end

#add new shoe brand
get('/brands/new') do
  erb(:brand_form)
end

#post new brand
post('/brands/new') do
  name = params.fetch('name')
  price = params.fetch('price').to_f()
  @new_brand = Brand.new({:name => name, :price => price})
  if @new_brand.save()
    redirect('/brands')
  else
    erb(:brand_form)
  end
end

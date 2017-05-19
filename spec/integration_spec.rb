require('spec_helper')

describe('adding a new store', {:type => :feature}) do
  it('allows a user to add new store') do
    visit('/')
    click_link('Add Store')
    fill_in('name', :with =>'foot paradise')
    click_button('Save')
    expect(page).to have_content('Foot Paradise')
  end
end

describe('adding a new brand', {:type => :feature}) do
  it('allows a user to add new brand') do
    visit('/')
    click_link('Add Brand')
    fill_in('name', :with =>'nike')
    fill_in('price', :with => '50')
    click_button('Save')
    expect(page).to have_content('Nike: $50.0')
  end
end


describe('List of stores', {:type => :feature}) do
  it('allows a user to see all of the stores that have been created') do
    store_1 = Store.create({:name => 'Foot Heaven'})
    store_2 = Store.create({:name => 'Foot Heaven'})
    visit('/')
    expect(page).to have_content(store_1.name)
    expect(page).to have_content(store_2.name)
  end
end

describe('List of brands', {:type => :feature}) do
  it('allows a user to see all of the brands that have been created') do
    brand_1 = Brand.create({:name => 'brand1', :price => '10'})
    brand_2 = Brand.create({:name => 'brand2', :price => '10'})
    visit('/brands')
    expect(page).to have_content(brand_1.name)
    expect(page).to have_content(brand_2.name)
  end
end

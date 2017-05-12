require('spec_helper')

describe(Store) do
  #save store names with capital letter
  it('capitalize the name of the store when saved') do
    test_store = Store.create({:name => 'foot heaven'})
    expect(test_store.name()).to(eq('Foot Heaven'))
  end

  it('validates the presence of name') do
    test_store = Store.new({:name => ''})
    expect(test_store.save()).to(eq(false))
  end

  it("ensures the length of description is at most 100 characters") do
    test_store = Store.new({:name => 'a'.*(101)})
    expect(test_store.save()).to(eq(false))
  end

  it("ensures all brands are unique") do
    store_1 = Store.create({:name => 'Foot Heaven'})
    store_2 = Store.new({:name => 'Foot Heaven'})
    expect(store_2.save()).to(eq(false))
  end

  # add shoe store
  describe('#name') do
    it('returns the name of the store') do
      test_store = Store.create({:name => 'foot heaven'})
      expect(test_store.name()).to(eq('Foot Heaven'))
    end
  end
  #update shoe store
  describe('#update') do
    it('update the name of the store') do
      test_store = Store.create({:name => 'Foot Heaven'})
      test_store.update({:name => 'Foot paradise'})
      expect(test_store.name()).to(eq('Foot Paradise'))
    end
  end
  #list all shoe stores
  describe('.all') do
    it('returns the array of the saved stores') do
      expect(Store.all()).to(eq([]))
    end
  end
  #delete shoe store
  describe('#delete') do
    it('deletes the store') do
      test_store = Store.create({:name => 'Foot Heaven'})
      test_store2 = Store.create({:name => 'Foot Paradise'})
      test_store.delete()
      expect(Store.all()).to(eq([test_store2]))
    end
  end
  #add shoe brands to a store
  describe('#brands') do
    it('add brands to a store') do
      test_store = Store.create({:name => 'Foot Heaven'})
      brand_1 = test_store.brands.create({:name => 'Nike'})
      brand_2 = test_store.brands.create({:name => 'New Balance'})
      expect(test_store.brands()).to(eq([brand_1, brand_2]))
    end
  end
end

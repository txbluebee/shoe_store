require('spec_helper')

describe(Store) do
  # add shoe store
  describe('#name') do
    it('returns the name of the store') do
      test_store = Store.create({:name => 'Foot Heaven'})
      expect(test_store.name()).to(eq('Foot Heaven'))
    end
  end
  #update shoe store
  describe('#update') do
    it('update the name of the store') do
      test_store = Store.create({:name => 'Foot Heaven'})
      test_store.update({:name => 'Foot Paradise'})
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
      
      brand_1 = Shoe.create({:name => 'Nike'})
      brand_2 = Shoe.create({:name => 'New Balance'})

    end
  end
end

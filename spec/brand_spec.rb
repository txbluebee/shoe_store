require('spec_helper')

describe(Brand) do
  # add shoe brand
  describe('#name') do
    it('returns the name of the brand') do
      test_brand = Brand.create({:name => 'Nike'})
      expect(test_brand.name()).to(eq('Nike'))
    end
  end
end

require('spec_helper')

describe(Brand) do
  #save brand names with capital letter
  it('capitalize the name of the brand when saved') do
    brand = Brand.new({:name => 'nike'})
    brand.save()
    expect(brand.name()).to(eq('Nike'))
  end

  # add shoe brand
  describe('#name') do
    it('returns the name of the brand') do
      test_brand = Brand.create({:name => 'Nike'})
      expect(test_brand.name()).to(eq('Nike'))
    end
  end
end

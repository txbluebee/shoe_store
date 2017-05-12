require('spec_helper')

describe(Brand) do
  #save brand names with capital letter
  it('capitalize the name of the brand when saved') do
    brand = Brand.new({:name => 'nike'})
    brand.save()
    expect(brand.name()).to(eq('Nike'))
  end

  it('validates the presence of name') do
    brand = Brand.new({:name => ''})
    expect(brand.save()).to(eq(false))
  end

  it("ensures the length of description is at most 100 characters") do
    brand = Brand.new({:name => 'a'.*(101)})
    expect(brand.save()).to(eq(false))
  end

  it("ensures all brands are unique") do
    brand_1 = Brand.create({:name => 'Nike'})
    brand_2 = Brand.new({:name => 'Nike'})
    expect(brand_2.save()).to(eq(false))
  end

  # add shoe brand
  describe('#name') do
    it('returns the name of the brand') do
      test_brand = Brand.create({:name => 'Nike'})
      expect(test_brand.name()).to(eq('Nike'))
    end
  end
end

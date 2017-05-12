class ChangeTypeOfPriceOnBrands < ActiveRecord::Migration[5.1]
  def change
    remove_column(:brands, :price, :float)
    add_column(:brands, :price, :decimal, :precision => 16, :scale => 2)
  end
end

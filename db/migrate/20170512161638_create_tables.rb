class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table(:stores) do |t|
      t.column(:name, :string)
    end

    create_table(:brands) do |t|
      t.column(:name, :string)
      t.column(:price, :int)
    end

    create_table(:brands_stores) do |t|
      t.column(:brand_id, :int)
      t.column(:store_id, :int)
    end
  end  
end

class CreateWarehouses < ActiveRecord::Migration[7.0]
  def change
    create_table :warehouses do |t|
      t.string :city
      t.string :city_code
      t.string :name
      t.integer :area

      t.timestamps
    end
  end
end

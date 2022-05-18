class CreateSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :corporate_name
      t.string :adress
      t.string :cnpj
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end

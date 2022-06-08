class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.integer :test_attr

      t.timestamps
    end
  end
end

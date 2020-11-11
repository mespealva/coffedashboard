class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.references :product, foreign_key: true
      t.date :date
      t.integer :amount

      t.timestamps
    end
  end
end

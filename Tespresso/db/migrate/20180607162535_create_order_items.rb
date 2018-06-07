class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.references :order, index: true
      t.references :product, index: true
      t.timestamps
    end
  end
end

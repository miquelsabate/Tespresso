class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.references :product, index: true
      t.timestamps
    end
  end
end

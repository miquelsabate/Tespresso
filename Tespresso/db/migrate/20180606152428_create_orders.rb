class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :state
      t.references :user, index: true
      t.timestamps
    end
  end
end

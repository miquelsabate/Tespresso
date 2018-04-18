class CreateMachines < ActiveRecord::Migration[5.1]
  def change
    create_table :machines do |t|
      t.string :name
      t.string :image
      t.string :description
      t.float :price
      t.references :category, index: true
      t.timestamps
    end
  end
end

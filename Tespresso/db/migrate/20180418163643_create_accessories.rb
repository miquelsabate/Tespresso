class CreateAccessories < ActiveRecord::Migration[5.1]
  def change
    create_table :accessories do |t|

      t.timestamps
    end
  end
end

class CreateBlacks < ActiveRecord::Migration[5.1]
  def change
    create_table :blacks do |t|

      t.timestamps
    end
  end
end

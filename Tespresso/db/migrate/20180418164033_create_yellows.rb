class CreateYellows < ActiveRecord::Migration[5.1]
  def change
    create_table :yellows do |t|

      t.timestamps
    end
  end
end

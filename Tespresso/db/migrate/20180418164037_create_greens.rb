class CreateGreens < ActiveRecord::Migration[5.1]
  def change
    create_table :greens do |t|

      t.timestamps
    end
  end
end

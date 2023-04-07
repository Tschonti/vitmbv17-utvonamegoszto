class CreateEfforts < ActiveRecord::Migration[7.0]
  def change
    create_table :efforts do |t|
      t.string :name
      t.string :time
      t.integer :type
      t.references :route, null: false, foreign_key: true

      t.timestamps
    end
  end
end

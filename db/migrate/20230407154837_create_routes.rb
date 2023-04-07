class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.string :name
      t.string :link
      t.float :distance
      t.integer :elevation

      t.timestamps
    end
  end
end

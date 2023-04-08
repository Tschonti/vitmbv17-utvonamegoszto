class DropNameFromEffort < ActiveRecord::Migration[7.0]
  def change
    remove_column :efforts, :name
  end
end

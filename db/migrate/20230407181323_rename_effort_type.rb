class RenameEffortType < ActiveRecord::Migration[7.0]
  def change
    rename_column :efforts, :type, :effort_type
  end
end

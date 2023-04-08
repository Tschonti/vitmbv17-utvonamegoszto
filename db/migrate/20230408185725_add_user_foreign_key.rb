class AddUserForeignKey < ActiveRecord::Migration[7.0]
  def change
    add_column :efforts, :user_id, :bigint
    add_foreign_key :efforts, :users, column: :user_id
  end
end

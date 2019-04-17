class AddEditToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :target, :text
  end
end

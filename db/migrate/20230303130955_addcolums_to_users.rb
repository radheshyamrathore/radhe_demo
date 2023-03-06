class AddcolumsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :mob_no, :integer
    add_column :users, :address, :string
  end
end

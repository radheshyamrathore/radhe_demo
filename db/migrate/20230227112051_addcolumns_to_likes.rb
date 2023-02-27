class AddcolumnsToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :likable_id , :integer
    add_column :likes, :likable_type, :string
  end
end

class RemovecolumnsToLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :likable_id , :integer
    remove_column :likes, :likable_type, :string
  end
end

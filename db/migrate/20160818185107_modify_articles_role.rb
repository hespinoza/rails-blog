class ModifyArticlesRole < ActiveRecord::Migration
  def change
  	remove_column :users, :permission_level
  	add_column :users, :role, :string
  end
end

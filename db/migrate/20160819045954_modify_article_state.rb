class ModifyArticleState < ActiveRecord::Migration
  def change
  	remove_column :articles, :state
  	add_column :articles, :state, :string, default: "created"
  end
end

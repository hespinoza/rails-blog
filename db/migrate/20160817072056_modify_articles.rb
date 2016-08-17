class ModifyArticles < ActiveRecord::Migration
  def change
  	remove_column :articles, :visit_count
  	remove_column :articles, :state
  	add_column :articles, :visits_count, :integer, default: 0
  	add_column :articles, :state, :string, default: "new"
  end
end

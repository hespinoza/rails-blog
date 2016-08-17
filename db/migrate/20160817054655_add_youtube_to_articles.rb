class AddYoutubeToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :youtube, :string
    add_column :articles, :sinopsis, :text
    add_column :articles, :visit_count, :integer
    add_column :articles, :state, :string
  end
end

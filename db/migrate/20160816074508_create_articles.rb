class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :cover
      t.text :body

      t.timestamps null: false
    end
  end
end

class Article < ActiveRecord::Base
	belongs_to :user

	scope :from_new, -> { reorder(id: :desc) }
	scope :my_articles, ->(user) { where("user_id = ?", user) }
end

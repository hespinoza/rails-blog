class Article < ActiveRecord::Base
	belongs_to :user

	scope :from_new, -> { reorder(id: :desc) }
	scope :my_articles, ->(user) { where("user_id = ?", user) }
	scope :news, -> { where("category = 'news'") }
	scope :reviews, -> { where("category = 'reviews'") }
	scope :unboxing, -> { where("category = 'unboxing'") }
	scope :gameplays, -> { where("category = 'gameplays'") }
end

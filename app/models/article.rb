class Article < ActiveRecord::Base
	belongs_to :user
	scope :from_new, -> { reorder(id: :desc) }
end

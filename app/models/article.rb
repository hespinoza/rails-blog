class Article < ActiveRecord::Base

	scope :from_new, -> { reorder(id: :desc) }
end

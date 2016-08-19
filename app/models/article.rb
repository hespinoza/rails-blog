class Article < ActiveRecord::Base
	include AASM
	
	belongs_to :user

	scope :from_new, -> { reorder(id: :desc) }
	scope :my_articles, ->(user) { where("user_id = ?", user) }
	scope :news, -> { where("category = 'news'") }
	scope :reviews, -> { where("category = 'reviews'") }
	scope :unboxing, -> { where("category = 'unboxing'") }
	scope :gameplays, -> { where("category = 'gameplays'") }

	aasm column: "state" do
  		state :new, initial: true
  		state :revised
  		state :published
  		state :unpublished

  		event :revise do
  			transitions from: :new, to: :revised
  		end

  		event :publish do
  			transitions from: :revised, to: :published
  		end

  		event :unpublish do
  			transitions from: :published, to: :unpublished
  		end

  	end


end

class Article < ActiveRecord::Base
	include AASM
  extend FriendlyId
  
  friendly_id :name, use: :slugged
	
	belongs_to :user

	scope :from_new, -> { reorder(id: :desc) }
	scope :my_articles, ->(user) { where("user_id = ?", user) }
	scope :news, -> { where("category = 'news'") }
	scope :reviews, -> { where("category = 'reviews'") }
	scope :unboxing, -> { where("category = 'unboxing'") }
	scope :gameplays, -> { where("category = 'gameplays'") }

	aasm column: "state" do
  		state :created, initial: true
  		state :published
  		state :unpublished

  		event :revise do
  			transitions from: :unpublished, to: :created
  		end

  		event :publish do
  			transitions from: :created, to: :published
  		end

  		event :unpublish do
  			transitions from: :published, to: :unpublished
  		end

  	end


end

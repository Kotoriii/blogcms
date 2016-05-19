class Tag < ActiveRecord::Base
	has_many :taggings
	has_many :articles, through: :taggings #list of articles through taggings
end

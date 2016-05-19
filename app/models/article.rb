class Article < ActiveRecord::Base
	has_many :comments
	has_many :taggings
	has_many :tags, through: :taggings #list of tags through taggings
	def tag_list
		self.tags.collect do |tag|
			tag.name
		end.join(", ") #Convert tag objects to array of tag names
	end
	def tag_list=(tags_string)
		tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq #array, strings are unique, strip whitespace, add tag to list of tags for the article
		new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name)}
		self.tags = new_or_found_tags
	end
end

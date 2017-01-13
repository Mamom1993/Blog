class Category < ApplicationRecord
	has_many :articles
	validates :name, presence: true, length: {minimum: 5}
end

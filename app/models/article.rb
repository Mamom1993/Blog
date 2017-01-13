class Article < ApplicationRecord
	has_many :comments, dependent: :destroy
	validates :title, :text, presence: true, length: {minimum: 5}
	mount_uploader :image, ImageUploader
	belongs_to :category

end

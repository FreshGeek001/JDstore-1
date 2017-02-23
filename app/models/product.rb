class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  def self.search(search)
    where('title LIKE ?', "%#{search}%").or(where('description LIKE ?', "%#{search}%")).or(where('categories LIKE ?', "%#{search}%"))
end

  has_many :photos
  accepts_nested_attributes_for :photos
  has_many :posts
  has_many :prints
  accepts_nested_attributes_for :prints
end

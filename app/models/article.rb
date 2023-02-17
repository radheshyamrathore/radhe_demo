class Article < ApplicationRecord
  has_many :posts
  validates :title, :description, presence: true
end

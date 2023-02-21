class Article < ApplicationRecord
  has_many :posts
  has_many :comments
  belongs_to :user
  validates :title, :description, presence: true
end

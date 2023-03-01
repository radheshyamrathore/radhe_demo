class Post < ApplicationRecord
  belongs_to :user
  belongs_to :article
  has_many :comments
  has_many :likes
  validates :description,  length: { minimum: 30 }
end

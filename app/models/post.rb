class Post < ApplicationRecord
  belongs_to :user
  belongs_to :article
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  #validates :title, presence: true
  validate :custom_title_valid
  #validates :description,  length: { minimum: 30 }

  def custom_title_valid
    if title.blank?
      errors.add(:title, "please provide a valid title ")
    elsif title.match(/\A+[[:alpha:][:blank:]]+\z/) == nil
      errors.add(:title, "please provide title only characters or spaces ")
    end
  end
end
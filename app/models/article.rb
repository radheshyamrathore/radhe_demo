class Article < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy
  validate :custom_method 
  # validates :description, presence: true
  validate :description_method

  def custom_method
    if title.blank?
      errors.add(:title, " can not be blank ")
    elsif title.match(/\A+[[:alpha:][:blank:]]+\z/) == nil
      errors.add(:title, "please provide title only characters or spaces ")
    end
  end

  def description_method
    if description.length < 30
      errors.add(:description, "must be provided minimum 30 characters ")
    end
  end
end

class Potin < ApplicationRecord
 
  validates :content, presence: true 
  validates :title, 
    presence: true,
    length: {minimum: 3},
    length: {maximum: 14}
 
 
  belongs_to :user
  has_many :comments
  has_many :join_user_potins
  has_many :tags, through: :join_user_potins
  has_many :likes
end

class Comment < ApplicationRecord
 validates :content, presence: true 
 
 
 
 
  belongs_to :user
  belongs_to :potin
  belongs_to :like
end

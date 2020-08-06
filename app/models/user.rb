class User < ApplicationRecord
  validates :password, 
  presence:true,
  length: {minimum: 6}



  belongs_to :city
  has_many :potins
  has_many :sent_messages, foreign_key: 'sender_id', class_name: 'PrivateMessage'
  has_many :received_messages, foreign_key: 'recipient_id', class_name: 'PrivateMessage'
  has_many :comments
  has_secure_password
  has_many :likes


end

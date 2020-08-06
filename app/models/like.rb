class Like < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :potin, optional: true
  belongs_to :comment, optional: true 



end

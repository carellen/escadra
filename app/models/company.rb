class Company < ApplicationRecord
  scope :owner, ->(user) { where(user_id: user.id) }

  has_many :employments
  has_many :users, through: :employments

  validates :unp, presence: true, length: { is: 9 }
  validates :name, presence: true, length: { in: 2..100 }

end

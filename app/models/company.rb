class Company < ApplicationRecord
  belongs_to :user

  scope :owner, ->(user) { where(user_id: user.id) }

  validates :unp, presence: true, length: { is: 9 }
  validates :name, presence: true, length: { in: 2..100 }
end

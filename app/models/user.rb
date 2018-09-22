class User < ApplicationRecord
  has_many :employments
  has_many :companies, through: :employments

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable
end

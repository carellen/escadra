class Position < ApplicationRecord
  scope :by_company, ->(company_id) { where(company_id: company_id) }

  belongs_to :company

  validates :title, presence: true, length: { in: 2..50 }, uniqueness: { scope: :company }
end

class Employment < ApplicationRecord
  belongs_to :company
  belongs_to :employee
end

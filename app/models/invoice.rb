class Invoice < ApplicationRecord
  validates :invoice_amount, :due_date, :enrollment_id, presence: true
  belongs_to :enrollment
  validates :status, inclusion: {in: ['Aberta', 'Atrasada ou Paga']}
end

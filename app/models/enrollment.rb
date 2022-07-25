class Enrollment < ApplicationRecord
  validates :total_value, :number_invoices, :invoice_due_date, :institution_id, :student_id, presence: true
  belongs_to :institution
  belongs_to :student
end

class Enrollment < ApplicationRecord
  validates :total_value, :number_invoices, :invoice_due_date, :institution_id, :student_id, presence: true
  has_many :invoice, dependent: :destroy
  belongs_to :institution
  belongs_to :student
  validate :total_value, if: :total_value_valid?
  validate :number_invoices, if: :number_invoices_valid?
  validate :invoice_due_date, if: :due_date_valid?

  private

  def total_value_valid?
    total_value.to_f > 0
  end

  def number_invoices_valid?
    number_invoices.to_i >= 1
  end

  def due_date_valid?
    invoice_due_date.to_i >= 1 && invoice_due_date.to_i <= 31
  end
end

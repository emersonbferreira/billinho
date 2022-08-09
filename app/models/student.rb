class Student < ApplicationRecord
  validates :name, :cpf, :birth_date, :tel, :genere, :payment_method, presence: true
  validates :name, :cpf, uniqueness: true
  validates_cpf_format_of :cpf, message: 'invalid cpf'
  validates :genere, inclusion: %w[M F]
  validates :payment_method, inclusion: %w[Boleto Cartão]
  has_many :enrollment
end

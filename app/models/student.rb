class Student < ApplicationRecord
  validates :name, :cpf, :birth_date, :tel, :genere, :payment_method, presence:true
  validates_uniqueness_of :name, :cpf
  validates_cpf_format_of :cpf, cpf: {message: 'invalid cpf'}
  validates :genere, ['M', 'F'].include? :genere, genere: {message: 'invalid gênere'}
  validates :payment_method, ['Boleto', 'Cartão'].include? :payment_method, payment_method: {message: 'invalid payment method'}
end

class Institution < ApplicationRecord
  validates :name, :cnpj, presence: true
  validates_cnpj_format_of :cnpj, cnpj: {message: 'invalid cnpj'}
  validates :kind, ['Universidade', 'Escola', 'Creche'].include? :kind, kind: {message: 'invalid institution kind'}
end

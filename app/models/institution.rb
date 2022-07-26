class Institution < ApplicationRecord
  validates :name, :cnpj, presence: true, uniqueness: true
  validates_cnpj_format_of :cnpj, message: 'invalid cnpj'
  validates :kind, inclusion: %w(Universidade Escola Creche)
  has_many :enrollment
end

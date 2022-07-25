class Institution < ApplicationRecord
  validates_cnpj_format_of :cnpj, cnpj: {message: 'invalid cnpj'}
end

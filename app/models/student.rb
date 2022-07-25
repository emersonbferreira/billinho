class Student < ApplicationRecord
  validates_cpf_format_of :cpf, cpf: {message: 'invalid cpf'}
end

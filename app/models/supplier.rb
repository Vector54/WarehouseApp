class Supplier < ApplicationRecord
  validates :name, :corporate_name, :cnpj, :email, presence: true
  validates :cnpj, uniqueness: {message: 'CNJP existente no banco de dados.'}
  validates :cnpj, format: {with: /\A\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}\z/}
end

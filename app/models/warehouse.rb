class Warehouse < ApplicationRecord
  validates :name, :city, :city_code, :area, :adress, :cep, :description, presence: {message: 'não pode faltar.'}
	validates :city_code, length: { is: 3, message: 'precisa ter 3 letras.' }
  validates :city_code, :name, uniqueness: {message: 'já existente.'}
  validates :cep, format: {with: /\A\d{5}-\d{3}\z/ , message: 'precisa ter 5 números + hífen + 3 números.'}
end

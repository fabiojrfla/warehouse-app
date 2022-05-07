class Warehouse < ApplicationRecord
  validates :name, :code, :city, :area, :address, :cep, :description, presence: true
  validates :name, :code, uniqueness: true
  validates :code, format: { with: /\A[A-Z]{3}\z/ }
  validates :cep, format: { with: /\A\d{5}-\d{3}\z/ }
  validates :code, length: { is: 3 }
  validates :cep, length: { is: 9 }
end

class Warehouse < ApplicationRecord
  validates :name, :code, :city, :area, :address, :postal_code, :description, presence: true
  validates :name, :code, uniqueness: true
  validates :code, format: { with: /\A[A-Z]{3}\z/ }
  validates :postal_code, format: { with: /\A\d{5}-\d{3}\z/ }
  validates :state, format: { with: /\A[A-Z]{2}\z/ }
  validates :code, length: { is: 3 }
  validates :postal_code, length: { is: 9 }
  validates :state, length: { is: 2 }
end

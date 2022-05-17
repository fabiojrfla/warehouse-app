class Supplier < ApplicationRecord
  validates :corporate_name, :brand_name, :registration_number, :address, :city, :state, :postal_code, :email,
            :phone_number, presence: true
  validates :registration_number, :email, :phone_number, uniqueness: true
  validates :registration_number, format: { with: /\A\d{14}\z/ }
  validates :state, format: { with: /\A[A-Z]{2}\z/ }
  validates :postal_code, format: { with: /\A\d{5}-\d{3}\z/ }
  validates :phone_number, format: { with: /\d{10}\z/ }
  validates :registration_number, length: { is: 14 }
  validates :state, length: { is: 2 }
  validates :postal_code, length: { is: 9 }
  validates :phone_number, length: { in: 10..11 }
end

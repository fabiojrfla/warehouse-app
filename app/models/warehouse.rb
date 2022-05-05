class Warehouse < ApplicationRecord
  validates :name, :code, :city, :area, presence: true
end

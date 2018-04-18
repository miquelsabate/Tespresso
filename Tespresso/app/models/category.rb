class Category < ApplicationRecord
  has_many :capsules
  has_many :machines
  has_many :accessories
end

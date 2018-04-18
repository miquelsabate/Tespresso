class Capsule < ApplicationRecord
    belongs_to :category
    has_many :whites
    has_many :yellows
    has_many :greens
    has_many :blacks
end

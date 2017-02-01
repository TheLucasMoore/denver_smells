class City < ApplicationRecord
  has_many :reports, through: :neighborhoods
  has_many :neighborhoods
end

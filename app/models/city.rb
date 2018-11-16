class City < ApplicationRecord
  scope :alfabetico, ->{order("cities.title ASC")}
  has_many :tours
end

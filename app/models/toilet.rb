class Toilet < ApplicationRecord
  has_many :ratings
  has_many :users, through: :toilets
end

class User < ApplicationRecord
  has_many :ratings
  has_many :toilets, through: :users
end

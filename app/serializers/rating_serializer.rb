class RatingSerializer < ActiveModel::Serializer
  attributes :id, :value
  has_one :user
  has_one :toilet
end

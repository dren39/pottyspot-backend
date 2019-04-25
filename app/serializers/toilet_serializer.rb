class ToiletSerializer < ActiveModel::Serializer
  attributes :id, :api_id, :name, :street, :city, :state, :directions, :comments, :lat, :long, :distance, :password, :purchase
end

class VenueSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :image_url, :slug

  has_many :reviews
end

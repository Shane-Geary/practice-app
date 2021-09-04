class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :score, :venue_id
end

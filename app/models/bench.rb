class Bench < ApplicationRecord
    validates :title, :description, :seating, :lat, :lng, presence: true
    validates :price, presence: true, numericality: { in: 10..1000}

end

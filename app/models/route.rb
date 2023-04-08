class Route < ApplicationRecord
    has_many :efforts
    validates :name, length: { minimum: 1 }
    validates :link, length: { minimum: 1 }, format: { with: /\Ahttps:\/\// }
    validates :distance, numericality: true
    validates :elevation, numericality: { only_integer: true }
end

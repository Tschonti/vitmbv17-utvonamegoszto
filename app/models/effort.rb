class Effort < ApplicationRecord
  belongs_to :route
  belongs_to :user
  validates :time, length: { is: 8 }, format: { with: /\A[0-9][0-9]:[0-5][0-9]:[0-5][0-9]\z/ }
  validates :effort_type, numericality: {in: 1..3}
end

class Workout < ActiveRecord::Base
  validates :distance, presence: true, numericality: {greater_than: 0}

  belongs_to :day
end

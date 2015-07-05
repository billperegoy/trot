class TrainingPlan < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :distance, presence: true, numericality: true

  has_many :weeks
end

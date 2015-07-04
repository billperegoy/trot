class TrainingPlan < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :distance, presence: true, numericality: true
  validates :weeks, presence: true, numericality: { only_integer: true }
end

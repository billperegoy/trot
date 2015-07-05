class Week < ActiveRecord::Base
  validates :number, presence: true, numericality: {only_integer: true}, uniqueness: true

  belongs_to :training_plan
end

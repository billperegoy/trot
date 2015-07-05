class Week < ActiveRecord::Base
  validates :number, presence: true, numericality: {only_integer: true}, uniqueness: {scope: :training_plan}

  belongs_to :training_plan
end

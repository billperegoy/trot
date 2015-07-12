class Day < ActiveRecord::Base
  belongs_to :week
  has_many :workouts

  def distance
    workouts.inject(0) {|distance, workout| distance += workout.distance}
  end
end

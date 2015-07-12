require 'rails_helper'

RSpec.describe Workout, :type => :model do
  it { should validate_presence_of :distance }
  it { should validate_numericality_of(:distance).is_greater_than(0) }
end

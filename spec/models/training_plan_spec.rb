require 'rails_helper'

RSpec.describe TrainingPlan, :type => :model do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

  it { should validate_presence_of :distance }
  it { should validate_numericality_of :distance }

  it { should validate_presence_of :weeks }
  it { should validate_numericality_of(:weeks).only_integer }
end

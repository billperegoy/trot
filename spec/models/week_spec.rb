require 'rails_helper'

RSpec.describe Week, :type => :model do
  it { should validate_presence_of :number }
  it { should validate_uniqueness_of :number }
  it { should validate_numericality_of(:number).only_integer }
end

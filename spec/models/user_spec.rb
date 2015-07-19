require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should validate_presence_of :name }

  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }

  it { should validate_presence_of :start_day }
  it { should validate_inclusion_of(:start_day).
    in_array(['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']) }
end

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UsersHelper, :type => :helper do
  it "ordered_days_of_week works for Monday" do
    expect(ordered_days_of_week(start_day: 'Monday')).
      to eq(['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'])
  end

  it "ordered_days_of_week works for Tuesday" do
    expect(ordered_days_of_week(start_day: 'Tuesday')).
      to eq(['Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun', 'Mon'])
  end

  it "ordered_days_of_week works for Wedneday" do
    expect(ordered_days_of_week(start_day: 'Wednesday')).
      to eq(['Wed', 'Thu', 'Fri', 'Sat', 'Sun', 'Mon', 'Tue'])
  end

  it "ordered_days_of_week works for Thursday" do
    expect(ordered_days_of_week(start_day: 'Thursday')).
      to eq(['Thu', 'Fri', 'Sat', 'Sun', 'Mon', 'Tue', 'Wed'])
  end

  it "ordered_days_of_week works for Friday" do
    expect(ordered_days_of_week(start_day: 'Friday')).
      to eq(['Fri', 'Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu'])
  end

  it "ordered_days_of_week works for Saturday" do
    expect(ordered_days_of_week(start_day: 'Saturday')).
      to eq(['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'])
  end

  it "ordered_days_of_week works for Sunday" do
    expect(ordered_days_of_week(start_day: 'Sunday')).
      to eq(['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'])
  end


end

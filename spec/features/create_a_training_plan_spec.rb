require 'rails_helper'

feature "create a training plan" do
  scenario "with valid data" do
    visit new_training_plan_path
    fill_in "Name", with: 'Half Marathon Training Plan'
    fill_in "Distance", with: 13.1
    fill_in "Weeks", with: 12
    click_on "Create Training plan"

    expect(page).to have_content("Half Marathon Training Plan")
    expect(page).to have_content("Distance: 13.1")
    expect(page).to have_content("Time: 12 weeks")
  end
end

require 'rails_helper'

feature "create a training plan" do
  scenario "with valid data" do
    create_training_plan(name: 'Half Marathon Training Plan',
                         distance: 13.1,
                         weeks: 12
                        )

    expect(page).to have_content("Half Marathon Training Plan")
    expect(page).to have_content("Distance: 13.1")
    expect(page).to have_content("Time: 12 weeks")
  end

  scenario "with invalid data" do
    create_training_plan(name: '',
                         distance: 13.1,
                         weeks: 12
                        )

    expect(page).to have_content("can't be blank")
  end

  private
  def create_training_plan(name:, distance:, weeks:)
    visit new_training_plan_path
    fill_in "Name", with: name 
    fill_in "Distance", with: distance
    fill_in "Weeks", with: weeks
    click_on "Create Training plan"
  end
end

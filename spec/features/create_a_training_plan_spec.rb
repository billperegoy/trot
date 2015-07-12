require 'rails_helper'

feature "create a training plan" do
  scenario "with valid data" do
    create_training_plan(name: 'Half Marathon Training Plan',
                         distance: 13.1
                        )

    expect(page).to have_content("Half Marathon Training Plan")
    expect(page).to have_content("Distance: 13.1")
    expect(page).to have_content("Time: 0 weeks")
  end

  scenario "with invalid data" do
    create_training_plan(name: '',
                         distance: 13.1
                        )

    expect(page).to have_content("can't be blank")
  end

  feature "view all training plans" do
    scenario "with valid data" do
      create_training_plan(name: 'Half Marathon Training Plan',
                           distance: 13.1
                          )
      create_training_plan(name: 'Full Marathon Training Plan',
                           distance: 26.2
                          )


      visit training_plans_path
      expect(page).to have_content("All Training Plans")
      expect(page).to have_content("Half Marathon Training Plan")
      expect(page).to have_content("Full Marathon Training Plan")
    end
  end

  feature "can add new empty weeks to a training plan" do
    scenario "with valid data" do
      create_training_plan(name: 'Half Marathon Training Plan',
                           distance: 13.1
                          )
      create_week('1')
      expect(page).to have_content("Half Marathon Training Plan")
      expect(page).to have_content("Week 1")

      create_week('2')
      expect(page).to have_content("Half Marathon Training Plan")
      expect(page).to have_content("Week 1")
      expect(page).to have_content("Week 2")
    end

    scenario "with valid data" do
      create_training_plan(name: 'Half Marathon Training Plan',
                           distance: 13.1
                          )
      create_week('1')
      create_week('1')
      expect(page).to have_content("Number has already been taken")
    end
  end

  feature "Data for 7 days are created with each week" do
    scenario "with valid data" do
      create_training_plan(name: 'Half Marathon Training Plan',
                           distance: 13.1
                          )
      create_week('1')
      expect(page).to have_content("Day 0")
      expect(page).to have_content("Day 1")
      expect(page).to have_content("Day 2")
      expect(page).to have_content("Day 3")
      expect(page).to have_content("Day 4")
      expect(page).to have_content("Day 5")
      expect(page).to have_content("Day 6")
    end

  end

  private
  def create_training_plan(name:, distance:)
    visit new_training_plan_path
    fill_in "Name", with: name 
    fill_in "Distance", with: distance
    click_on "Create Training plan"
  end

  def create_week(number)
    click_button "Add a Week"
    fill_in "Number", with: number
    click_on "Create Week"
  end
end

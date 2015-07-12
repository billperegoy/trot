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

  feature "Distances can be added to training days" do
    scenario "with valid data" do
      create_training_plan(name: 'Half Marathon Training Plan',
                           distance: 13.1
                          )
      create_week('1')

      click_link_within(".week-1 .day-1", "new")

      create_workout("12")
      expect_text_within(".week-1 .day-1", "12")
    end

    scenario "with invalid data" do
      create_training_plan(name: 'Half Marathon Training Plan',
                           distance: 13.1
                          )
      create_week('1')

      click_link_within(".week-1 .day-1", "new")

      create_workout("-12")
      expect(page).to have_content("must be greater than 0")
    end
  end

  feature "distances for a week are properly summed" do
    scenario "with all days filled" do
      create_training_plan(name: 'Half Marathon Training Plan',
                           distance: 13.1
                          )
      create_week('1')
      add_workout_to(week: "1", day: "0", distance: "1")
      add_workout_to(week: "1", day: "1", distance: "2")
      add_workout_to(week: "1", day: "2", distance: "3")
      add_workout_to(week: "1", day: "3", distance: "4")
      add_workout_to(week: "1", day: "4", distance: "5")
      add_workout_to(week: "1", day: "5", distance: "6")
      add_workout_to(week: "1", day: "6", distance: "7")

      expect_text_within(".week-1 .total", "28")
    end

    scenario "with some days undefined" do
      create_training_plan(name: 'Half Marathon Training Plan',
                           distance: 13.1
                          )
      create_week('1')
      add_workout_to(week: "1", day: "0", distance: "1")
      add_workout_to(week: "1", day: "1", distance: "2")
      add_workout_to(week: "1", day: "2", distance: "3")
      add_workout_to(week: "1", day: "3", distance: "4")

      expect_text_within(".week-1 .total", "10")
    end
  end

  private
  def add_workout_to(week:, day:, distance:)
    click_link_within(".week-#{week} .day-#{day}", "new")
    create_workout(distance)
  end

  def click_link_within(context, link)
    within(context) do
      click_link  link
    end
  end

  def expect_text_within(context, text)
    within(context) do
      expect(page).to have_content(text)
    end
  end

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

  def create_workout(distance)
    fill_in "Distance", with: distance
    click_on "Create Workout"
  end
end

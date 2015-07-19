require 'rails_helper'

feature "create a user" do
  scenario "with valid data" do
    create_user(email: "yogi@bear.com", name: "Yogi Bear")
    expect(page).to have_content("Email: yogi@bear.com")
    expect(page).to have_content("Name: Yogi Bear")
  end

  scenario "with invalid data" do
    create_user(email: "", name: "")
    expect(page).to have_content("can't be blank")
  end

  scenario "user gets default prerences uon creation" do
    create_user(email: "yogi@bear.com", name: "Yogi Bear")
    expect(page).to have_content("Preferences")
    expect(page).to have_content("start_day : Monday")
  end

  scenario "user gets default empty calendar upon creation" do
    create_user(email: "yogi@bear.com", name: "Yogi Bear")
    check_week_day_order(start_day: "mon")
  end

  scenario "user can change starting day of calendar" do
    create_user(email: "yogi@bear.com", name: "Yogi Bear")

    click_link "Edit"
    select('Friday', :from => 'Start day')
    click_on "Update User"

    check_week_day_order(start_day: "fri")
  end
end


feature "user can display calandar for current week" do
  scenario "no calandar subscribed to"
  scenario" a calandar is subscribed to"
end

private
def create_user(email:, name:)
  visit new_user_path
  fill_in "Email", with: email
  fill_in "Name", with: name
  click_on "Create User"
end

def check_week_day_order(start_day:)
  days = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun']
  while (days[0] != start_day) do 
    days.rotate!
  end

  (0..6).each do |n|
    within(".calendar-header .day-#{n}") do
      expect(page).to have_content(days[n].capitalize)
    end
  end

end

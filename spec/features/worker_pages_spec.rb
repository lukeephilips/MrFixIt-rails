require 'rails_helper'

describe "the create a job path" do
  it 'logs in and claims a job', js: true do
  worker = FactoryGirl.create(:worker)
  user = FactoryGirl.create(:user)
  @job = FactoryGirl.create(:job)
  visit ''
  click_link 'Log In as Worker'
  fill_in 'Email', :with => 'worker@thing.com'
  fill_in 'Password', :with => 'badpassword'
  expect(page).to have_content "Password"
  click_on 'Log in'
  expect(page).to have_content "You're signed into your worker@thing.com worker account"

  click_on 'See All Jobs'
  expect(page).to have_content @job.title

  click_link @job.title
  expect(page).to have_content @job.description
  expect(page).to have_content "it's currently pending"



  end
end

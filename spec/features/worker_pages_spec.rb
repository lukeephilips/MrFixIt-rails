require 'rails_helper'

describe "the create a job path" do
  it 'logs in and claims a job' do
  worker = FactoryGirl.create(:worker)
  visit ''
  click_link 'Log In as Worker'
  fill_in 'Email', :with => 'worker@thing.com'
  fill_in 'Password', :with => 'badpassword'
  expect(page).to have_content "Password"
  click_on 'Log in'
  expect(page).to have_content "You're signed into your worker@thing.com worker account"
  end
end

require 'rails_helper'

describe "the create a job path" do
  it 'redirects when the user is not registered' do
    visit ''
    click_link "Add Your Job"
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end

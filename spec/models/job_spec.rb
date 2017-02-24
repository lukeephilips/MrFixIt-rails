require 'rails_helper'

RSpec.describe Job, type: :model do
  it {should belong_to :user}
  it "creates a new job" do
    user = FactoryGirl.create(:user)
    job = FactoryGirl.create(:job)
    expect(Job.all).to include job
  end
end

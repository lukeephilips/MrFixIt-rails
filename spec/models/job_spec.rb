require 'rails_helper'

RSpec.describe Job, type: :model do
  it {should belong_to :worker}
  it "creates a new job" do
    worker = FactoryGirl.create(:worker)
    job = FactoryGirl.create(:job)
    expect(Job.all).to include job
  end
end

FactoryGirl.define do
  factory(:worker) do
    email 'guy@thing.com'
    password 'badpassword'
  end
end
FactoryGirl.define do
    if Worker.any?
      @@worker = Worker.find_by(email: 'guy@thing.com')
    else
      @@worker = FactoryGirl.create(:worker)
    end
  factory(:job) do
    title 'fix code'
    description 'get all the unit tests to pass'
    completed false
    pending true
    worker_id @@worker.id
  end
end

FactoryGirl.define do
  factory(:worker) do
    email 'worker@thing.com'
    password 'badpassword'
  end
end
FactoryGirl.define do
  factory(:user) do
    email 'guy@thing.com'
    password 'badpassword'
  end
end
FactoryGirl.define do
    if User.any?
      @@user = User.find(1)
    else
      @@user = FactoryGirl.create(:user)
    end
  factory(:job) do
    title 'fix code'
    description 'get all the unit tests to pass'
    completed false
    pending true
    user_id @@user.id
  end
end

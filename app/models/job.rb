class Job < ActiveRecord::Base
  validates :title, :presence => true
  # belongs_to :workers
  belongs_to :user

end

module ApplicationHelper
  def job_pending_to_claimed(job)
    if job.pending == true
      'Claimed'
    else
      'Unclaimed'
    end
  end
end

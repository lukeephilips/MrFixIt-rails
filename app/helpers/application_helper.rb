module ApplicationHelper
  def job_pending_to_claimed(job)
    if job.pending == true
      'Unclaimed'
    else
      'Claimed'
    end
  end
end

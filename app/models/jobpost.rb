class Jobpost < ActiveRecord::Base
  attr_accessible :company_id, :employees_req, :job_budget, :job_description, :job_duration, :job_end_date, :job_location, :job_start_date, :job_type
end

Microjobs::Application.routes.draw do
  get "/" =>"User#root"
  post "/signup" => "User#signup"
  get "/signup" => "User#new"

  post "/login" => "User#signin"
  get "/login" => "User#login"

  get "/user" => "CompanyDashboard#user_profile"
  get "/candidate_matches" => "CompanyDashboard#potential_candidates"
  get "/job_post" =>"CompanyDashboard#job_post"

  get "/job_matches" => "User#potential_jobs"
  get "/job" =>"User#job"

  get "/company_login" =>"CompanyDashboard#root"
  get "/new_job_post" =>"CompanyDashboard#new_job_post"
  post "/post_a_job" =>"CompanyDashboard#post_a_job"
  get "/notify_candidate" => "CompanyDashboard#notify_user"

  get "/post-a-job" => "CompanyDashboard#new_job_post"
  post "/post-a-job" => "CompanyDashboard#job_post_save"
  

end

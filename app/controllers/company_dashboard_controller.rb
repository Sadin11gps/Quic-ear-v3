class CompanyDashboardController < ApplicationController
	def user_profile
		@user = User.first
	end
	def new_job_post

	end
	def root
	end
	def post_a_job
		date = params[:daterange].split("-")
		puts "*"*80
		puts params
		new_job = Jobpost.new(job_description:params[:job_desc],job_start_date:date[0],job_end_date:date[1],job_type:params[:job_type],job_budget:params[:budget],employees_req:params[:quantity],job_location:params[:job_loc],company_id:session[:id])
		new_job.save

		redirect_to :controller => "CompanyDashboard", :action => "root"
	end
	def job_post
		@job_posts = Jobpost.where(company_id:session[:id])
	end
	def potential_candidates
		job_id = session[:jobid]
		current_job = Jobpost.where(id: job_id).first
		location = current_job.job_location
		job_type = current_job.job_type
		list_of_users = User.all
		@matches = []
		list_of_users.each do |user|
			if user.preferred_location.split("/").include?(location) and user.preferred_jobs.split("/").include?(job_type)
				@matches<<user
			end
		end
	end

	def new_job_post

	end

	def job_post_save
		puts "* "*60
		puts params

		date = params[:daterange].split("-")

		new_job = Jobpost.new(job_description:params[:job_desc],job_start_date:date[0],job_end_date:date[1],job_type:params[:job_type],job_budget:params[:budget],employees_req:params[:quantity],job_location:params[:job_loc],company_id:session[:id])
		new_job.save
	end

	def notify_user
		user = User.find(params[:id])
		user.available = false
		user.save
		job = Jobpost.find(params[:jobid])

		message = "Hi, You have been assigned the job for #{job.job_description} with JOB-ID #{job.id} at #{job.job_location} for #{job.job_type} job."
		to = user.mob_num

		exec("php ~/Desktop/microjobs/external_files/sms.php #{to} #{message}")

	end
end

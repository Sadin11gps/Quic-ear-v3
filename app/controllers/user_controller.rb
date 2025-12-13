class UserController < ApplicationController
	
	def new 
		
	end

	def login

	end

	def signup
		if params[:type]=="user"
			@user = User.new(name: params[:name], mob_num: params[:mob_num], preferred_jobs: params[:preferred_jobs].join('/'), preferred_location: params[:preferred_location].join('/'),ratings: 0.0,available: true, experience: 0,password: params[:password], password_confirmation: params[:password_confirmation])			
		elsif params[:type]=="agent"
			@user = Agent.new(name: params[:name], mob_num: params[:mob_num], max_emp_count: params[:max_emp_count], preferred_emp_type: params[:preferred_emp_type].join('/'),preferred_job_location: params[:preferred_job_location].join('/'),ratings: 0.0,available: true, experience: 0,password: params[:password], password_confirmation: params[:password_confirmation])		
		else
			@user = Company.new(name: params[:name], organisation: params[:organisation], organisation_type: params[:organisation_type], email: params[:email],address: params[:address],password: params[:password], password_confirmation: params[:password_confirmation])		
		end
		if @user.save
			session[:id] = @user.id
			session[:type] = @user.class.to_s

			if params[:type]=="user"
				redirect_to :controller => 'User', :action => 'potential_jobs'
			elsif params[:type]=="agent"
				redirect_to :controller => 'User', :action => 'potential_jobs'
			else
				redirect_to :controller => 'CompanyDashboard', :action => 'root'
			end
			# render :dashboard
		else
			render :error
		end
	end

	def signin
		mob_num = params[:mob_num]
		password = params[:password]
		puts "* "*50
		puts mob_num
		user = User.where(mob_num:mob_num).first
		puts user
		user = Agent.where(mob_num: mob_num).first if user.blank?

		user = Company.where(email: mob_num).first if user.blank?

		unless user.blank?
			if user.authenticate password
				session[:id] = user.id
				session[:type] = user.class.to_s
				puts "^ "*50
				puts user.class.to_s
				if  user.class.to_s == "User"
					redirect_to :controller => 'User', :action => 'potential_jobs'
				elsif user.class.to_s ==  "Agent"
					redirect_to :controller => 'User', :action => 'potential_jobs'
				else
					redirect_to :controller => 'CompanyDashboard', :action => 'root'
				end
			else
				render :error
			end
		end
	end

	def potential_jobs
		@user = User.where(id: session[:id]).first
		jobs = Jobpost.all
		@matches =[]
		jobs.each do |job|
			if @user.preferred_jobs.split("/").include?(job.job_type) and @user.preferred_location.split("/").include?(job.job_location)
				@matches << job
			end
		end
	end

	def job
		@job = Jobpost.first
	end
	def root
	end
end

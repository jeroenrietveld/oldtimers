require "bundler/capistrano"	

set :application, "oldtimers"
set :repository, "git@github.com:jeroenrietveld/oldtimers.git"
set :scm, :git
set :branch, "develop"

default_run_options[:pty] = true

set :deploy_to, "/var/www/oldtimers"
set :user, "ec2-user"
server "ec2-54-244-184-155.us-west-2.compute.amazonaws.com", :app, :web, :db, :primary => true
#ssh_options[:keys] = ["#{ENV['HOME']}/Downloads/jeroen.pem"]
ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_rsa")]
ssh_options[:forward_agent] = true

desc "check production task"
	task :check_production do

	if stage.to_s == "production"
		puts " \n Are you REALLY sure you want to deploy to production?"
		puts " \n Enter the password to continue\n "
		password = STDIN.gets[0..7] rescue nil
		if password != 'pass'
			puts "\n !!! WRONG PASSWORD !!!"
			exit
		end
	end
end

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
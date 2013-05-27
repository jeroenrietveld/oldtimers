require "bundler/capistrano" 

set :application, "oldtimer"
set :domain,      "oldtimer.dev-this.com"
set :deploy_to,   "/home/wesley/domains/#{domain}/public_html/oldtimer"
set :use_sudo,    false

set :repository,  "git@github.com:jeroenrietveld/oldtimers.git"
set :scm,         :git
set :branch,      "develop"

set :keep_releases, 5
set :deploy_via, :remote_cache

ssh_options[:forward_agent] = true
ssh_options[:keys] = %w('~/.ssh/id_rsa.pub')
ssh_options[:port] = "5678"
set :user,           "root"

after "deploy:restart", "deploy:cleanup" 

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web,        domain                         # Your HTTP server, Apache/etc
role :app,        domain                         # This may be the same as your `Web` server
role :db,         domain, :primary => true 

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"
after 'deploy:update_code', 'deploy:migrate'

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
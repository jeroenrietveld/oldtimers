set :user, "ec2-user"
server "ec2-54-244-184-155.us-west-2.compute.amazonaws.com", :app, :web, :db, :primary => true
ssh_options[:keys] = ["#{ENV['HOME']}/Downloads/jeroen.pem"]
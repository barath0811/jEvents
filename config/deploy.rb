require "bundler/capistrano"

set :application, "JollyEventz"
set :repository,  "git@github.com:rnarayana/jEvents.git"

set :scm, :git
set :deploy_to, "/home/secondjo/public_html"
set :branch, "master"
set :deploy_via, :remote_cache

server "174.34.174.2", :web, :app, :db, primary: true
#set :port, 25000

set :user, "secondjo"
set :use_sudo, false

default_run_options[:pty] = true
# ssh_options[:forward_agent] = true

set :keep_releases, 5
after "deploy:restart", "deploy:cleanup" 

after 'deploy:update_code', 'deploy:migrate'

task :setup_config, roles: :app do
	run "mkdir -p #{shared_path}/config"
	put File.read("config/database.yml.template"), "#{shared_path}/config/database.yml"
	puts "Now edit the config files in #{shared_path}."
end
after "deploy:setup", "deploy:setup_config"

task :symlink_config, roles: :app do
	run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
end
after "deploy:finalize_update", "deploy:symlink_config"

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
	task :start do ; end
	task :stop do ; end
	task :restart, :roles => :app, :except => { :no_release => true } do
		run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
	end
end
require "bundler/capistrano"

set :application, "JollyEventz"
set :repository,  "git@github.com:rnarayana/jEvents.git"

set :scm, :git
set :deploy_to, "/home/secondjo/public_html"
set :branch, "master"
set :deploy_via, :remote_cache

server "174.34.174.2", :web, :app, :db, primary: true
#set :port, 25000

set :user, "root"
set :use_sudo, false

default_run_options[:pty] = true
# ssh_options[:forward_agent] = true

set :bundle_flags,    ""

after "deploy", "deploy:cleanup" 

after 'deploy:update_code', 'deploy:migrate'

##### Begin SiteMap #####
after "deploy:update_code", "deploy:copy_old_sitemap"
namespace :deploy do
  task :copy_old_sitemap do
    run "if [ -e #{shared_path}/public/sitemap.xml.gz ]; then cp #{shared_path}/public/sitemap* #{current_release}/public/; fi"
  end
end

after "deploy", "refresh_sitemaps"
task :refresh_sitemaps do
  run "cd #{release_path} && RAILS_ENV=#{rails_env} rake sitemap:refresh"
end

##### End SiteMap #####

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
	task :start do ; end
	task :stop do ; end
	task :restart, :roles => :app, :except => { :no_release => true } do
		run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
	end

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

	desc "Make sure local git is in sync with remote."
	task :check_revision, roles: :web do
		unless `git rev-parse HEAD` == `git rev-parse origin/master`
			puts "WARNING: HEAD is not the same as origin/master"
			puts "Run `git push` to sync changes."
			exit
		end
	end
	before "deploy", "deploy:check_revision"
end
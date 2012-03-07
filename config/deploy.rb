set :application, "Antrim Glen"
set :repository,  "git@github.com:aeonblue3/Antrim.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to, "/home/honey/public_html"

server "expiredhoney.com", :app, :web, :db, :primary => true

set :user, "honey"
set :port, "22222"

ssh_options[:forward_agent] = true

set :branch, "master"
set :scm_verbose, true
set :deploy_via, :remote_cache
set :use_sudo, false

# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
namespace :bundle do
  desc "run bundle install and ensure all gem requirements are met"
  task :install do
    run "cd #{current_path} && bundle install --without=test --no-update-sources"
  end
end
before "deploy:restart", "bundle:install"
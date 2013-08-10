require "bundler/capistrano"

set :application, "knee-scum"
set :repository,  "git@github.com:royvandewater/knee-scum"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "knee-scum.royvandewater.com"                          # Your HTTP server, Apache/etc
role :app, "knee-scum.royvandewater.com"                          # This may be the same as your `Web` server
role :db,  "knee-scum.royvandewater.com", :primary => true # This is where Rails migrations will run

set :user, "deploy"
set :deploy_to, "/home/deploy/apps/#{application}"

after 'deploy:update_code', 'deploy:migrate'
after "deploy:restart", "deploy:cleanup"

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

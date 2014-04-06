set :application, "Pinteresting"
set :repo_url,  "git@github.com:teresanzano/onemonthrails.git"

role :web, "162.243.236.170"                 
role :app, "162.243.236.170"                        
role :db,  "162.243.236.170", :primary => true 

set :user, "rails"
set :password, "X54GFxv5h2"

set :stages, %w[staging production]
set :default_stage, 'staging'

set :use_sudo, false
set :deploy_to, "/home/rails/"
set :deploy_via, :copy

set :normalize_asset_timestamps, false

#require 'bundler/capistrano'
#require "rvm/capistrano"


# config valid only for Capistrano 3.1
lock '3.1.0'
set :scm, :git


namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end

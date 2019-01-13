# frozen_string_literal: true

# Application
# ===========
set :application, 'fyp'
set :deploy_to, "/data/code/#{fetch :application}"
set :rails_env, 'production'

set :linked_files, %w[config/settings.local.yml config/database.yml]
set :linked_dirs, %w[log tmp/pids tmp/sockets vendor/bundle public/uploads]

# Git
# ===
set :branch, 'master'
set :repo_url, 'git@github.com:porosb/syrnik.git'

# SSH
# ===
set :ssh_options,
    user: 'ksevelyar',
    forward_agent: true

# Capistrano
# ==========
set :format, :pretty
set :log_level, :debug
set :keep_releases, 7

# Tasks
# =====
namespace :deploy do
  after :finishing, 'deploy:cleanup'
  after :publishing, :restart

  desc 'Start application'
  task :start do
    on roles(:app) do
      execute "sudo /etc/init.d/unicorn_#{fetch :application} start"
    end
  end

  desc 'Stop application'
  task :stop do
    on roles(:app) do
      execute "sudo /etc/init.d/unicorn_#{fetch :application} stop"
    end
  end

  desc 'Restart application'
  task :restart do
    invoke 'deploy:stop'
    sleep 3
    invoke 'deploy:start'
  end
end

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

# config valid only for current version of Capistrano
lock "3.10.2"

set :application, "fln-server"
set :repo_url, "git@github.com:FoolishMeow/FLNServer.git"
set :rvm_ruby_version, '2.5.0'

set :deploy_to, "/var/www/fln"
set :pty,             true
set :use_sudo,        false

set :deploy_via,      :remote_cache

set :keep_releases, 3
set :linked_dirs,  %w(log tmp/pids tmp/cache tmp/sockets vendor/bundle)
append :linked_files, %w(.env config/master.key)

# SSH
set :ssh_options, { :forward_agent => true }

# Puma
set :puma_threads, [2, 4]
set :puma_workers, 2
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_conf,       "#{shared_path}/puma.rb"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{shared_path}/log/puma.access.log"
set :puma_error_log,  "#{shared_path}/log/puma.error.log"
set :puma_role, :app
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true # Change to true if using ActiveRecord

# Sidekiq
set :sidekiq_config, 'config/sidekiq.yml'

# DB tasks
set :db_local_clean, false
set :db_remote_clean, true
set :disallow_pushing, true
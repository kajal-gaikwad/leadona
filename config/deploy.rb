# config valid only for current version of Capistrano
# lock '3.9.1'

set :application, 'leadona'
set :scm, :git
set :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
set :repo_url, 'git@gitlab.com:wgbl/leadona.git'
set :rvm_ruby_version, 'ruby-2.6.2'

set :puma_bind,       "unix://#{shared_path}/tmp/sockets/leadona.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to true if using ActiveRecord

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts "WARNING: HEAD is not the same as origin/master"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end
  after  :finishing,    :cleanup
end

namespace :puma_leadona do
  %w[start stop restart].each do |command|
    desc "#{command} Puma server."
    task command do
      on roles(:app) do
        execute "sudo systemctl #{command} puma_leadona.service"
      end
    end
  end
end
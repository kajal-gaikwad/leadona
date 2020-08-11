# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

set :user, 'deploy'
set :deploy_via, :remote_cache
set :use_sudo, false
set :branch, 'deploy'

server '13.127.251.27', user: 'deploy', roles: %w{web app db}

set :deploy_to, '/var/www/leadona'

role :app, %w{deploy@13.127.251.27}
role :web, %w{deploy@13.127.251.27}
role :db,  %w{deploy@13.127.251.27}


set :ssh_options, {
  keys: %w(~/.ssh/id_rsa),
  forward_agent: true,
  auth_methods: %w(publickey)
}

set :rails_env, :production
set :conditionally_migrate, true

set :use_sudo, false
set :bundle_binstubs, nil

Rake::Task['puma:restart'].clear_actions

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/errors', 'public/uploads', 'public/.well-known')

# Default value for keep_releases is 5
set :keep_releases, 10

after 'deploy:publishing', 'deploy:restart'
# after 'deploy:starting', 'sidekiq:stop'
# after 'deploy:updated', 'sidekiq:stop'
# after 'deploy:reverted', 'sidekiq:stop'
# after 'deploy:published', 'sidekiq:start'

namespace :deploy do
  task :restart do
    invoke 'puma_service:stop'
    invoke 'puma_service:start'
  end

  task :stop do
    invoke 'puma_service:stop'
  end
end
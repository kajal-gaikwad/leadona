# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

set :user, 'deploy'
set :deploy_via, :remote_cache
set :use_sudo, false
set :branch, 'admin-layout'

server '15.206.139.171', user: 'deploy', roles: %w{web app db}

set :deploy_to, '/var/www/leadona'

set :assets_roles, [:web, :app]
role :app, %w{deploy@15.206.139.171}
role :web, %w{deploy@15.206.139.171}
role :db,  %w{deploy@15.206.139.171}

set :ssh_options, {
  keys: %w(~/.ssh/id_rsa),
  forward_agent: true,
  auth_methods: %w(publickey)
}

set :rails_env, :staging
set :conditionally_migrate, true
set :assets_roles, []

set :use_sudo, false
set :bundle_binstubs, nil
# if ENV['RAILS_ENV'] == 'staging'
# Rake::Task['deploy:compile_assets'].clear_actions
# end
Rake::Task['puma:restart'].clear_actions

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/errors', 'public/uploads')

# Default value for keep_releases is 5
set :keep_releases, 3

after 'deploy:publishing', 'deploy:restart'
after 'deploy:migrate', 'deploy:compile_assets'
# after 'deploy:starting', 'sidekiq:stop'
# after 'deploy:updated', 'sidekiq:stop'
# after 'deploy:reverted', 'sidekiq:stop'
# after 'deploy:published', 'sidekiq:start'
# after 'deploy:updated', 'deploy:symlink_uploads'

namespace :deploy do
  task :restart do
    invoke 'puma_service:stop'
    invoke 'puma_service:start'
  end

  task :stop do
    invoke 'puma_service:stop'
  end
end
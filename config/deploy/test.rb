# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

set :user, 'deploy'
set :deploy_via, :remote_cache
set :use_sudo, false
set :branch, 'test'

server '52.66.160.78', user: 'deploy', roles: %w{web app db}

set :deploy_to, '/var/www/journeycart'

role :app, %w{deploy@52.66.160.78}
role :web, %w{deploy@52.66.160.78}
role :db,  %w{deploy@52.66.160.78}


set :ssh_options, {
  keys: %w(~/.ssh/id_rsa),
  forward_agent: true,
  auth_methods: %w(publickey)
}

set :rails_env, :test
set :unicorn_rack_env, :test
set :conditionally_migrate, true

set :use_sudo, false
set :bundle_binstubs, nil

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/errors', 'public/uploads')

# Default value for keep_releases is 5
set :keep_releases, 3

after 'deploy:publishing', 'deploy:restart'
# after 'deploy:updated', 'deploy:symlink_uploads'

namespace :deploy do
  task :restart do
    invoke 'unicorn:stop'
    invoke 'unicorn:start'
  end

  task :stop do
    invoke 'unicorn:stop'
  end
end
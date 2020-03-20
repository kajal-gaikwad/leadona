# Load DSL and set up stages
require 'capistrano/setup'
require 'capistrano/deploy'
# unless ENV['RAILS_ENV'] == 'staging'
require 'capistrano/rails'
# end
require 'capistrano/rvm'
# require 'capistrano/sidekiq'
require 'capistrano/puma'
install_plugin Capistrano::Puma
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git
# require 'capistrano/sidekiq/monit'

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }

# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

task :disable_database_environment_check do
  ENV['DISABLE_DATABASE_ENVIRONMENT_CHECK'] = '1'
end

task reset: [
  'fly:disable_database_environment_check',
  'db:migrate:reset',
  'db:migrate',
  'db:seed'
]

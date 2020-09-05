require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

require './app/controllers/authentication_controller'
require './app/controllers/application_controller'

use AuthenticationController
run ApplicationController

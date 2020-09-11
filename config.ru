require './config/environment'

# if ActiveRecord::Migrator.needs_migration?
#   raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
# end

require './app/controllers/authentications_controller'
require './app/controllers/application_controller'

use Rack::MethodOverride

run ApplicationController
use BookReportsController
use AuthenticationsController
use BooksController

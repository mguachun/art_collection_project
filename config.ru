require './config/environment'



# if ActiveRecord::Migrator.needs_migration?
#   raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
# end

# run ApplicationController

use Rack::Static, :urls => ['/css'], :root => 'public' # Rack fix allows seeing the css folder.

# if defined?(ActiveRecord::Migrator) && ActiveRecord::Migrator.needs_migration?
#   raise 'Migrations are pending run `rake db:migrate` to resolve the issue.'
# end
use Rack::MethodOverride
use CollectionsController
use UsersController
run ApplicationController
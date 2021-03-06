class Trustlink::MigrationGenerator < Rails::Generators::Base
  require 'rails/generators'
  require 'rails/generators/migration'

  include Rails::Generators::Migration
  source_root File.expand_path('../templates', __FILE__)

  def self.next_migration_number(dirname)
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime('%Y%m%d%H%M%S')
    else
      sprintf('%.3d', (current_migration_number(dirname) + 1))
    end
  end

  def create_migration_file
    migration_template 'migration.rb', 'db/migrate/create_trustlink_storage.rb'
  end
end

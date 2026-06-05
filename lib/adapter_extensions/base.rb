require "pathname"
require "active_record"
require "active_record/version"

module AdapterExtensions
  AdapterPath = File.join File.expand_path(File.dirname(__FILE__)), "/active_record/adapters"

  # Loads the extensions for a specific database adapter
  def self.require_adapter(adapter)
    require File.join(AdapterPath, "/abstract_adapter")
    specific_adapter = File.join(AdapterPath, "/#{adapter}_adapter")
    require specific_adapter if File.exist?(specific_adapter + '.rb')
  end

  def self.load_from_connection_pool(connection_pool)
    # Rails 6.1 replaced `connection_pool.spec` (ConnectionSpecification) with
    # `connection_pool.db_config` (DatabaseConfigurations::HashConfig). Both
    # expose adapter name; pick whichever the runtime supports.
    adapter_name =
      if connection_pool.respond_to?(:db_config)
        connection_pool.db_config.adapter
      else
        connection_pool.spec.config[:adapter]
      end
    require_adapter(adapter_name)
  end
end

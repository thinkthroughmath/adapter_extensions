require 'adapter_extensions/base'

module AdapterExtensions
  module EstablishConnectionHook
    def establish_connection(*args, **kwargs)
      result = super
      ActiveSupport.run_load_hooks(:active_record_connection_established, connection_pool)
      result
    end
  end
end

ActiveRecord::Base.singleton_class.prepend(AdapterExtensions::EstablishConnectionHook)

ActiveSupport.on_load(:active_record_connection_established) do |connection_pool|
  AdapterExtensions.load_from_connection_pool connection_pool
end

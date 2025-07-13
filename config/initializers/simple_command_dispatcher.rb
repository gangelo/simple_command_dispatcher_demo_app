# frozen_string_literal: true

require 'simple_command_dispatcher'

# Autoload command classes
Rails.application.config.to_prepare do
  commands_path = Rails.root.join('app', 'api')
  
  if commands_path.exist?
    Dir[commands_path.join('**', '*.rb')].each do |file|
      require_dependency file
    end
  end
end

# Configure simple_command_dispatcher
SimpleCommandDispatcher.configure do |config|
  # Configuration options will be added in future versions
end
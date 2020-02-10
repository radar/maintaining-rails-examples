require 'bundler'
Bundler.setup

require 'dry/system/container'
require 'dry/system/components'

module Projects
  class Application < Dry::System::Container
    use :env, inferrer: proc { ENV.fetch('PROJECTS_ENV', 'development') }

    configure do |config|
      config.root = File.expand_path('..', __dir__)
      config.default_namespace = 'projects'

      config.auto_register = 'lib'
    end

    load_paths!('lib')
  end

  Import = Dry::AutoInject(Application)
end

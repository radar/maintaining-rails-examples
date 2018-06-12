require 'rom'
require 'rom-sql'

require_relative 'projects/repositories/projects'
require_relative 'projects/project'

module Projects
  DB = ROM.container(:sql, 'postgres://localhost/projects_dev') do |config|
    config.gateways[:default].use_logger(Logger.new($stdout))

    config.auto_registration('./lib/projects')
  end
end

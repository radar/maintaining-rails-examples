Projects::Application.boot(:db) do |app|
  init do
    require "rom"
    require "rom-sql"

    connection = Sequel.connect(ENV['DATABASE_URL'], extensions: %i[pg_timestamptz])
    register('db.connection', connection)
    register('db.config', ROM::Configuration.new(:sql, connection))
  end

  start do
    config = app['db.config']
    config.auto_registration(app.root + "lib/projects")

    register('db.container', ROM.container(config))
  end
end

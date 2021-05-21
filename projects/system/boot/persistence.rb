Projects::Application.boot(:persistence) do |app|
  init do
    require "rom"
    require "rom-sql"

    register('db.connection', app[:settings].database_url)
  end
end

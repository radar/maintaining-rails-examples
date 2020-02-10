Projects::Application.boot(:persistence) do
  init do
    require "rom"
    require "rom-sql"

    register('db.connection', Sequel.connect('postgres://localhost/projects_dev'))
  end
end

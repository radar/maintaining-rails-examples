Projects::Application.boot(:settings, from: :system) do
  before :init do
    require 'projects/types'
  end

  settings do
    key :database_url, Projects::Types::String.constrained(filled: true)
  end
end

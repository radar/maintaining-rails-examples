module Projects
  module Repos
    class UserRepo < ROM::Repository[:users]
      include Import["db.container"]
      struct_namespace Projects

      commands :create,
        use: :timestamps,
        plugins_options: {
          timestamps: {
            timestamps: %i(created_at updated_at)
          }
        }

      def all
        users.to_a
      end
    end
  end
end

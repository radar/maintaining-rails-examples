module Projects
  module Repositories
    class Projects < ROM::Repository[:projects]
      struct_namespace ::Projects

      commands :create, update: :by_pk, delete: :by_pk

      def all
        projects.to_a
      end

      def by_id(id)
        projects.by_pk(id).one
      end
    end
  end
end

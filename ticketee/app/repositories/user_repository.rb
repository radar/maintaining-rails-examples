class UserRepository < ROM::Repository::Root
  root :users

  commands :create, update: :by_pk, delete: :by_pk

  struct_namespace Users

  def contributors_for_project(project_id)
    users.contributors_for_project(project_id).to_a
  end
end

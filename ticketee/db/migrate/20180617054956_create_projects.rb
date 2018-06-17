ROM::SQL.migration do
  change do
    create_table :projects do
      primary_key :id
      column :name, :text, null: false
    end
  end
end

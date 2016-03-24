Hanami::Model.migration do
  change do
    create_table :repositories do
      primary_key :id
      column :name, String, null: false, uniq: true
    end
  end
end

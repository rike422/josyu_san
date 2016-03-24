Hanami::Model.migration do
  change do
    create_table :mergebles do
      primary_key :id
      foreign_key :pull_id, :pulls, on_delete: :cascade, null: false
      column :status, Integer, null: false
    end
  end
end

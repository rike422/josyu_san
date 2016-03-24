Hanami::Model.migration do
  change do
    create_table :build_statuses do
      primary_key :id
      foreign_key :pull_id, :pulls, on_delete: :cascade, null: false
      column :builder, String, null: false
      column :status, Integer, null: false
      column :url, String, null: false
      column :merge_sha, String, null: false
    end
  end
end

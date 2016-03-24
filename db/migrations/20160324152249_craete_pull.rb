Hanami::Model.migration do
  change do
    create_table :pulls do
      primary_key :id
      foreign_key :repository_id, :repositories, on_delete: :cascade, null: false
      column :num, Integer null: false
      column :status, String null: false
      column :merge_sha, String
      column :title, String
      column :body, String
      column :head_sha, String
      column :head_ref, String
      column :base_ref, String
      column :assignee, String
      column :approved_by, String
      column :priority, Integer
      column :try_, Integer
      column :rollup, Integer
      column :delegate, String
    end
  end
end

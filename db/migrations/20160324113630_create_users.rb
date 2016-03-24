Hanami::Model.migration do
  change do
    create_table :users do
      primary_key :id
      column :name, String, null: false
      column :nickname, String
      column :image, String
      column :email, String
      column :github_access_token, String, null: false, uniq: true

    end
  end
end

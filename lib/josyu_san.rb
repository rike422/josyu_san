require 'hanami/model'
require 'hanami/mailer'
Dir["#{ __dir__ }/josyu_san/**/*.rb"].each { |file| require_relative file }

Hanami::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/josyu_san_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/josyu_san_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/josyu_san_development'
  #    adapter type: :sql, uri: 'mysql://localhost/josyu_san_development'
  #
  adapter type: :file_system, uri: ENV['JOSYU_SAN_DATABASE_URL']

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  # You can specify mapping file to load with:
  #
  # mapping "#{__dir__}/config/mapping"
  #
  # Alternatively, you can use a block syntax like the following:
  #
  mapping do
    collection :users do
      entity User
      repository UserRepository
      attribute :id, Integer
      attribute :name, String
      attribute :nickname, String
      attribute :image, String
      attribute :email, String
      attribute :github_access_token, String
    end

    collection :repositories do
      entity Repository
      repository RepositoryRepository
      attribute :id, Integer
      attribute :name, Strin
    end
    collection :build_statuses do
      entity BuildStatus
      repository BuildStatusRepository
      attribute :id, Integer
      attribute :pull_id, Integer
      attribute :builder, String
      attribute :status, Integer
      attribute :url, String
      attribute :merge_sha
    end
    collection :mergeables do
      entity Mergeable
      repository MergeableRepository
      attribute :id, Integer
      foreign_key :pull_id, Integer
      column :status, Integer
    end
    collection :pulls do
      entity Pull
      repository PullRepository
      attribute :id, Integer
      attribute :repository_id, Integer
      attribute :num, Integer
      attribute :status, String
      attribute :merge_sha, String
      attribute :title, String
      attribute :body, String
      attribute :head_sha, String
      attribute :head_ref, String
      attribute :base_ref, String
      attribute :assignee, String
      attribute :approved_by, String
      attribute :priority, Integer
      attribute :try_, Integer
      attribute :rollup, Integer
      attribute :delegate, String
    end
  end
end.load!

Hanami::Mailer.configure do
  root "#{ __dir__ }/josyu_san/mailers"

  # See http://hanamirb.org/guides/mailers/delivery
  delivery do
    development :test
    test :test
    # production :stmp, address: ENV['SMTP_PORT'], port: 1025
  end
end.load!

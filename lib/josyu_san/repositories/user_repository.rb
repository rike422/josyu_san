class UserRepository
  include Hanami::Repository

  def self.from_omniauth(omniauth)
    github_id = omniauth.uid
    attrs = {}
    attrs[:name] = omniauth.info.name
    attrs[:nickname] = omniauth.info.nickname
    attrs[:image] = omniauth.info.image
    attrs[:email] = omniauth.info.email || omniauth.extra.raw_info.email
    attrs[:github_access_token] = omniauth.credentials.token

    record = where(github_id: github_id).first
    if record
      record.update(attrs)
      update found
    else
      create(User.new(attrs.merge(github_id: github_id)))
    end
  end
end

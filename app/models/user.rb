class User < ActiveRecord::Base
  validates :uid, presence: true, numericality: { only_integer: true }
  validates :name, presence: true
  validates :nickname, presence: true
  validates :image, presence: true
  validates :token, presence: true #length 50?
  validates :secret, presence: true #length 45?

  def self.find_or_create_from_twitter(omniauth)
    find_or_create_by(uid: omniauth[:uid]) do |user|
      user.uid = omniauth[:uid]
      user.name = omniauth[:info][:name]
      user.nickname = omniauth[:info][:nickname]
      user.image = omniauth[:info][:image]
      user.description = omniauth[:info][:description]
      user.token = omniauth[:credentials][:token]
      user.secret = omniauth[:credentials][:secret]
    end
  end
end

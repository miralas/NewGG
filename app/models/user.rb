class User < ActiveRecord::Base
  rolify
  has_many :news
  has_and_belongs_to_many :companies
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    if User.count == 0
      self.add_role :admin
    else
      self.add_role :client
    end
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
    end
  end

end

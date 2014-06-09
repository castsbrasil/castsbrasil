class User < ActiveRecord::Base
  SOCIALS = [:facebook, :github, :twitter, :linkedin]

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: SOCIALS

  has_many :authorizations, dependent: :destroy

  def values
    @values ||= Attributes.new(self)
  end

  def set_attributes_from_oauth(oauth)
    values.set_from_oauth(oauth)
    self
  end

  def self.new_from_oauth(oauth)
    new.set_attributes_from_oauth(oauth)
  end
end
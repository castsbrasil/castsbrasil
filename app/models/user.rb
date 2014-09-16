class User < ActiveRecord::Base
  include Gamefication

  SOCIALS = %i(github)

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: SOCIALS

  has_one :profile, dependent: :destroy

  has_many :authorizations, dependent: :destroy
  has_many :casts, dependent: :destroy

  before_validation :add_free_role
  after_create :create_profile

  rolify

  def self.find_or_initialize_by_oauth(auth, user)
    Authorization.find_or_initialize_by_oauth(auth, user).user
  end

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

  def password_required?
    (authorizations.empty? || !password.blank?) && super
  end

  private

  def add_free_role
    self.add_role :free
  end
end

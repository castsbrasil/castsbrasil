class User < ApplicationRecord
  include Gamefication

  SOCIALS = %i(github)

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: SOCIALS

  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile

  has_many :authorizations, dependent: :destroy
  has_many :casts, dependent: :destroy

  before_validation :add_free_role
  after_create :create_profile, if: Proc.new { profile.nil? }

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
    user = new.set_attributes_from_oauth(oauth)
    user.profile = Profile.new_from_oauth(oauth)
    user
  end

  def password_required?
    (authorizations.empty? || !password.blank?) && super
  end

  private

  def add_free_role
    self.add_role :free
  end

  def self.new_with_session(params, _session)
    user = new(params)
    user.profile = Profile.new(params[:profile_attributes] || {})
    user
  end
end

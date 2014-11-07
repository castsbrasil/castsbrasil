class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :links, dependent: :destroy

  accepts_nested_attributes_for :links, allow_destroy: true, reject_if: :all_blank
  validates_presence_of :first_name

  def values
    @values ||= Attributes.new(self)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def avatar
    return user.authorizations.github.avatar_url if user.authorizations.github.present?
    Gravatar.new(user.email).image_url
  end

  def set_attributes_from_oauth(oauth)
    values.set_from_oauth(oauth)
    self
  end

  def self.new_from_oauth(oauth)
    new.set_attributes_from_oauth(oauth)
  end
end

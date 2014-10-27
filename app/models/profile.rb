class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :links, dependent: :destroy

  accepts_nested_attributes_for :links, allow_destroy: true, reject_if: :all_blank

  def full_name
    "#{first_name} #{last_name}"
  end

  def avatar
    avatar = if user.authorizations.github.present?
      user.authorizations.github.avatar_url
    else
      gravatar = Gravatar.new(user.email)
      gravatar.url if gravatar.exists?
    end
    avatar
  end
end

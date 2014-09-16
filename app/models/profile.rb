class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :links, dependent: :destroy
  accepts_nested_attributes_for :links, allow_destroy: true, reject_if: :all_blank
end

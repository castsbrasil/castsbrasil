# frozen_string_literal: true

class Role < ApplicationRecord
  belongs_to :resource, polymorphic: true
  has_and_belongs_to_many :users, join_table: :users_roles

  scopify
end

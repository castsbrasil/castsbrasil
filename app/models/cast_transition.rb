# frozen_string_literal: true

class CastTransition < ApplicationRecord
  include Statesman::Adapters::ActiveRecordTransition
  belongs_to :cast, inverse_of: :cast_transitions
end

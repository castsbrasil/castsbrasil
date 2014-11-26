class Cast < ActiveRecord::Base
  include Taggable

  belongs_to :user
  has_many :cast_transitions, dependent: :destroy

  scope :desc, -> { order(created_at: :desc) }
  scope :find_by_param, -> (param) { find(param) }
  scope :most_recent, -> { desc.limit(10) }

  validates_presence_of :name, :url

  def state_machine
    @state_machine ||= CastStateMachine.new(self, transition_class: CastTransition)
  end

  delegate :can_transition_to?, :transition_to!, :transition_to, :current_state, to: :state_machine
end

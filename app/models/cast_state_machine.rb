class CastStateMachine
  include Statesman::Machine

  state :started, initial: :true
  state :approved
  state :need_improvement
  state :not_approved

  transition from: :started, to: [:approved]
  transition from: :started, to: [:need_improvement]
  transition from: :started, to: [:not_approved]
  transition from: :approved, to: [:need_improvement]
  transition from: :need_improvement, to: [:approved]
end

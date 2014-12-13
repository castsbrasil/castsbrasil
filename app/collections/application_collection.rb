class ApplicationCollection
  def initialize(attributes = {})
    attributes.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  def method_missing(method_name, *_args)
    return instance_variable_get("@#{method_name}") if instance_variable_defined?("@#{method_name}")
    super
  end

  def respond_to?(method_name, include_private = false)
    return true if instance_variable_defined?("@#{method_name}")
    super
  end
end

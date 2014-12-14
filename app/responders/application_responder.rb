class ApplicationResponder < Zertico::Responder
  include Responders::FlashResponder
  include Responders::HttpCacheResponder
  include Responders::CollectionResponder
  include Responders::LocationResponder
end

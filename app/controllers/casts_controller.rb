class CastsController < AuthorizedController
  skip_before_action :authenticate_user!, only: %i(index show)
end

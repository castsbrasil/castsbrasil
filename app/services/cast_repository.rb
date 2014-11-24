class CastRepository
  attr_reader :most_recent, :most_viewed, :all_screencasts

  def get_home_collections
    @most_recent = Cast.most_recent
    @most_viewed = Cast.none

    self
  end
end

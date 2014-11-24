class CastRepository
  attr_reader :most_recent, :most_viewed, :screencasts_list

  def get_home_collections
    @most_recent = Cast.most_recent
    @most_viewed = Cast.none

    self
  end

  def get_screencasts_collections
    @screencasts_list = Cast.all.desc

    self
  end
end

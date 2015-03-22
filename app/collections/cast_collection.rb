class CastCollection < ApplicationCollection
  def self.filtered
    new(most_recent: Cast.most_recent,
        most_viewed: Cast.most_recent)
  end

  def self.filtered_and_limited
    new(most_recent: Cast.most_recent.limit(4),
        most_viewed: Cast.most_recent.limit(4))
  end

  def self.filtered_by_user(user_id)
    new(most_recent: Cast.most_recent.by_user(user_id),
        most_viewed: Cast.most_recent)
  end

  def self.all
    new(all: Cast.all.desc)
  end
end

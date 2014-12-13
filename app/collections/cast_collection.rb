class CastCollection < ApplicationCollection
  def self.filtered
    new(most_recent: Cast.most_recent,
        most_viewed: Cast.none)
  end

  def self.all
    new(all: Cast.all.desc)
  end
end

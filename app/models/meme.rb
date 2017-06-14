class Meme < ApplicationRecord

  def self.newest_first
    Meme.order("created_at DESC")
  end

  def self.most_recent_five
    Meme.newest_first.limit(5)
  end

  def self.created_before(time)
    Meme.where("created_at < ?", time)
  end


end

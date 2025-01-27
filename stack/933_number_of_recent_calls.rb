# frozen_string_literal: true

class RecentCounter
  def initialize
    @queue = []
  end

  def ping(t)
    @queue << t
    @queue.shift while t - @queue.first > 3000
    @queue.size
  end
end

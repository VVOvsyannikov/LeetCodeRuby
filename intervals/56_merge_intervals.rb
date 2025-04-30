# frozen_string_literal: true

def merge(intervals)
  return intervals if intervals.empty?

  intervals.sort! { |a, b| a[0] <=> b[0] }
  result = [intervals.first]

  (1...intervals.size).each do |i|
    current = intervals[i]
    last = result.last

    if current.first > last.last
      result << current
    elsif current.last > last.last
      result[-1] = [result[-1].first, current.last]
    end
  end
  result
end

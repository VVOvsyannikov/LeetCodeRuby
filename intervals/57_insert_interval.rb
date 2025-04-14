# frozen_string_literal: true

def insert(intervals, new_interval)
  return [new_interval] if intervals.empty?

  new_interval_added = false
  result = []
  index = 0

  while index < intervals.size
    current = intervals[index]

    if new_interval_added || new_interval[0] > current[0]
      result = add_to_result(result, current)
    else
      result = add_to_result(result, new_interval)
      index -= 1
      new_interval_added = true
    end

    index += 1
  end

  result = add_to_result(result, new_interval) unless new_interval_added
  result
end

def add_to_result(result, interval)
  return [interval] if result.empty?

  if interval[0] <= result[-1][1]
    result[-1][1] = [interval[1], result[-1][1]].max
  else
    result << interval
  end

  result
end
